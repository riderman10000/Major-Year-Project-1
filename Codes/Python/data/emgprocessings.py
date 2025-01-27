#change file name later 

import numpy as np 
import librosa 
import librosa.display
import matplotlib.pyplot as plt 
from scipy import signal

#METHODS FOR FEATURES
def filter_data(data, dataplot= False,  filter_response_plot = False, sampling_frequency = 250):
	#this follows the arnav process
	#signal processing
	#	- hpf, notch filter (50 Hz) x 3 with harmonics, lpf  

	#applying high pass filter - 0.5, used to remove frequencies lower than 0.5Hz
	filter_order = 1
	# critical_frequencies = [15, 50] #in Hz
	critical_frequency = 1.5 	# in Hz
	FILTER = 'highpass'				#'bandpass'
	output = 'sos'
	#design butterworth bandpass filter
	sos = signal.butter(filter_order, critical_frequency, FILTER, fs = sampling_frequency, output= output)
	filtered = signal.sosfilt(sos, data)
	
	#response of the high pass filter
	if(filter_response_plot):
		b, a = signal.butter(filter_order, critical_frequency, FILTER, sampling_frequency)
		w, h = signal.freqz(b, a, sampling_frequency)
		plt.semilogx(w, 20 * np.log10(abs(h)))
		plt.xlabel('Frequency [radians / second]')
		plt.ylabel('Amplitude [dB]')
		plt.margins(0, 0.1)
		plt.grid(which = 'both', axis = 'both')
		
		cutoff_freq = []
		cutoff_freq.append(critical_frequency)
		for freq in cutoff_freq:
			plt.axvline(freq, color = 'green')
		plt.show()

	#normalize -(normalizing to a mean amplitude of zero (still need to cross check this))
	data = data - np.mean(data, axis = 0)

	#applying notch filter
	notch_times = 3
	notch_frequency = 50 	#Hz
	quality_factor = 30 	# -- no reason just copied.
		
	#power line noise @ 50 Hz and its harmonics.
	freqs = list(map(int , list(map(round, np.arange(1, sampling_frequency/(2. * notch_frequency))* notch_frequency ))  ))
	for _ in range(notch_times):
		for f in reversed(freqs):
			#design notch filter 
			b, a = signal.iirnotch(f, quality_factor, sampling_frequency)
			filtered = signal.lfilter(b, a, filtered)
	
	#response of iirnotch filter
	if filter_response_plot:
		# Frequency response
		freq, h = signal.freqz(b, a, fs=sampling_frequency)
		# Plot
		fig, ax = plt.subplots(2, 1, figsize=(8, 6))
		ax[0].plot(freq, 20*np.log10(abs(h)), color='blue')
		ax[0].set_title("Frequency Response")
		ax[0].set_ylabel("Amplitude (dB)", color='blue')
		ax[0].set_xlim([0, 100])
		ax[0].set_ylim([-25, 10])
		ax[0].grid()
		ax[1].plot(freq, np.unwrap(np.angle(h))*180/np.pi, color='green')
		ax[1].set_ylabel("Angle (degrees)", color='green')
		ax[1].set_xlabel("Frequency (Hz)")
		ax[1].set_xlim([0, 100])
		ax[1].set_yticks([-90, -60, -30, 0, 30, 60, 90])
		ax[1].set_ylim([-90, 90])
		ax[1].grid()
		plt.show()


	#applying lowpass filter  50 Hz
	filter_order = 1
	# critical_frequencies = [15, 50] #in Hz for bandpass 
	critical_frequencies = 50	# in Hz
	FILTER = 'lowpass'				#'bandpass'
	output = 'sos'

	#design butterworth lowpass filter
	sos = signal.butter(filter_order, critical_frequencies, FILTER, fs = sampling_frequency, output= output)
	filtered = signal.sosfilt(sos, data)

	#response of the lowpass filter
	if(filter_response_plot):
		output = 'ba'
		b, a = signal.butter(filter_order, critical_frequencies, FILTER, fs = sampling_frequency, output= output)
		w, h = signal.freqz(b, a, fs  = sampling_frequency)
		plt.semilogx(w, 20 * np.log10(abs(h)))
		plt.xlabel('Frequency [radians / second]')
		plt.ylabel('Amplitude [dB]')
		plt.margins(0, 0.1)
		plt.grid(which = 'both', axis = 'both')

		for freq in critical_frequencies:
			plt.axvline(freq, color = 'green')
		plt.show()
	
	#applying ricker
	ricker_width = 35 * sampling_frequency // 250
	ricker_sigma = 4.0 * sampling_frequency / 250 #4.0...
	ricker = signal.ricker(ricker_width,ricker_sigma)
	# normalize ricker
	ricker = np.array(ricker, np.float32) / np.sum(np.abs(ricker))
	#obtain the ricker in the data 
	convolution = signal.convolve(filtered,ricker,mode="same")
	#remove the heart beat artifacts from the original signal
	filtered = filtered - 2*convolution
	
	if(filter_response_plot):
		plt.plot(convolution)
		plt.show()	

	return filtered
# END OF METHODS FOR FEATURES

# METHODS FOR FEATURES 
def emg_correct_mean(x):
	'''
	corrects the emg mean 
	As baseline emg values have an offset from zero. 
	'''
	x = x - np.mean(x, axis = 0)
	return x 

def emg_rectify(x):
	x = abs(x)
	return x 

def double_average(x):
	f = np.ones(9)/9.0
	v = np.convolve(x, f, mode='same')
	w = np.convolve(v, f, mode='same')
	return w 

def get_emg_features(emg_data, debug= False):
	# xs = emg_data - emg_data.mean(axis=0, keepdims = True)
	frame_feature = []
	for i in range(emg_data.shape[-1]):
		x = emg_data[:,i]
		# print("raw value x.shape ",x.shape)
		w = double_average(x)
		# print("double average w.shape ",w.shape)
		p = x - w 
		# print("p.shape ",p.shape)
		r = np.abs(p) #rectified high frequency signal
		# print("r.shape ",r.shape)
		
		# _
		# w : frame based time domain mean of double_average
		w_h = librosa.util.frame(w, frame_length= 16, hop_length= 1).mean(axis= 0)
		# print("w_h.shape ",w_h.shape)
		
		#Pw - frame based power
		p_w = librosa.feature.rms(w, frame_length= 16, hop_length= 1, center= False)
		p_w = np.squeeze(p_w, 0)
		# print("p_w.shape ",p_w.shape)

		#Pr - frame based power of rectified high frequency signal
		p_r = librosa.feature.rms(r, frame_length= 16, hop_length= 1, center= False)
		p_r = np.squeeze(p_r, 0)
		# print("p_r.shape ",p_r.shape)
		
		#zp - frame based zero crossing rate
		z_p = librosa.feature.zero_crossing_rate(p, frame_length= 16, hop_length= 1, center= False)
		z_p = np.squeeze(z_p, 0)
		# print("zero crossing z_p.shape ",z_p.shape)
		
		# _
		# r : frame based time domain mean of rectified high frequency signal
		r_h = librosa.util.frame(r, frame_length= 16, hop_length= 1).mean(axis= 0)
		# print("recrifie high frequecy r_h.shape ",r_h.shape)

		s = abs(librosa.stft(np.ascontiguousarray(x), n_fft= 16, hop_length= 1, center= False))
		# print("short time fourirer transform s.shape ",s.shape)

		if 	debug:
			plt.subplot(7, 1, 1)
			plt.plot(x)				#plots the filtered signal 
			plt.subplot(7, 1, 2)
			plt.plot(w_h)			#plots the frame based	time domain mean of double_average
			plt.subplot(7, 1, 3)
			plt.plot(p_w)			#plots the frame based power
			plt.subplot(7, 1, 4)
			plt.plot(p_r)			#plots the frame based of rectified high frequency signal
			plt.subplot(7, 1, 5)
			plt.plot(z_p)			#plots the frame based zero crossing rate
			plt.subplot(7, 1, 6)
			plt.plot(r_h)			#plots the time domain mean of rectified high frequency signal
			
			plt.subplot(7, 1, 7)	#plots the spectrogram(?still not sure?) of the stft
			plt.imshow(s, origin='lower', aspect= 'auto', interpolation= 'nearest')
			plt.tight_layout()
			plt.show()


		#stacking the temporal features mentioned above.
		frame_feature.append(np.stack([w_h, p_w, p_r, z_p, r_h], axis= 1))
		#stacking the spectral features i.e stft of the signal.
		frame_feature.append(s.T)

	frame_feature = np.concatenate(frame_feature, axis= 1)
	return frame_feature.astype(np.float32)	

#source 
'''
Digital voicing...
https://scientificallysound.org/2016/08/22/python-analysing-emg-signals-part-4/
'''
# END OF METHODS FOR FEATURES 


# METHODS FOR STATS 
# from scipy.signal import fftconvolve
# def similarity(template, test):
# 	corr = fftconvolve(template, test, mode = 'same')
# 	return max(abs(corr))

from scipy  import signal 
def similarity(sig1, sig2):
	corr = signal.correlate(sig1, sig2, mode='same')

#source
'''
https://stackoverflow.com/questions/33383650/using-cross-correlation-to-detect-an-audio-signal-within-another-signal
'''
# END OF METHODS FOR STATS 

#methods to make some task easy like plots.
# import matplotlib.pyplot as plt 
#method to print the channel in subplots, just pass the data[X] or data[X][:, X:Y]
def graphit(arr, title = 0, saveplot = 0):
	fig, axes = plt.subplots(arr.shape[-1], sharex = True, sharey= True)
	fig.text(0.5,0.02,'Samples', ha = 'center')
	fig.text(0.02,0.5,'Amplitude', va = 'center', rotation= 'vertical')
	# fig.suptitle(title)
	fig.tight_layout()
	for i in range(arr.shape[-1]):
		axes[i].title.set_text('Channel '+ str(i+ title +1))
		axes[i].plot(arr[:,i])
	if saveplot == 0 or saveplot == 2:
		plt.show()
	elif saveplot == 1 or saveplot == 2:
		plt.savefig(title+'.png')

#for fft
from scipy.fft import fft, fftfreq
def fftplot(data_x):
	N = len(data_x)
	T = 1.0 / 250.0
	yf = fft(data_x)
	xf = fftfreq(N, T)[:N//2]
	plt.plot(xf, 2.0/N * np.abs(yf[0:N//2]))
	plt.xlabel("Frequency")
	plt.ylabel("Power")
	plt.grid()
	plt.show()

def running_mean(x, N):
	'''
	x array of data
	N number of samples per average
	'''
	cumsum = np.cumsum(np.insert(x, 0 , 0))
	return (cumsum[N:] - cumsum[:-N]) / float(N)