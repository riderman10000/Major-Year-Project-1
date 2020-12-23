#system
import numpy as np 
import glob

#created
import processing

path = './mentally' 	#later, we will change to data dir. which is only for data 
# path = '/home/rimesh/Files/major/codes/AlterEgo-master/Core'
sampling_frequency = 250	#	Hz

#load data
def dataset(**kwargs):
	data_dir = path
	filepaths = glob.glob(path + "/**/*.txt", recursive= True)
	filepaths = filepaths[:3]
	# kwargs = 
	return [processing.process(1, [file], labels = file.split('/')[-2],**kwargs) for file in filepaths]

total_data = dataset(channels = range(0, 8), surrounding=210)


from scipy import signal
def filter_data(data):
	#this follows the arnav process

	#signal processing
	#	- bpf, notch filter (50 Hz)
	
	#applying high pass filter - 0.5, used to remove frequencies lower than 0.5Hz
	filter_order = 1
	# critical_frequencies = [15, 50] #in Hz
	critical_frequency = 0.5 	# in Hz
	FILTER = 'highpass'				#'bandpass'
	output = 'sos'
	#design butterworth bandpass filter
	sos = signal.butter(filter_order, critical_frequency, FILTER, fs = sampling_frequency, output= output)
	filtered = signal.sosfilt(sos, data)


	#normalize -(normalizing to a mean amplitude of zero (still need to cross check this))
	data = data - np.mean(data, axis = 0)

	#3rd order notch (butterworth// need to implement still) - power line noise , 50 Hz and its harmonics.
	#applying notch filter
	notch_times = 3
	notch_frequency = 50 	#Hz
	quality_factor = 30 	# 			-- no reason just copied.
	
	#design notch filter 
	# b, a = signal.iirnotch(notch_frequency, quality_factor, sampling_frequency)
	# filtered = signal.lfilter(b, a, filtered)
	
	freqs = list(map(int , list(map(round, np.arange(1, sampling_frequency/(2. * notch_frequency))* notch_frequency ))  ))
	for _ in range(notch_times):
		for f in reversed(freqs):
			b, a = signal.iirnotch(f, quality_factor, sampling_frequency)
			filtered = signal.lfilter(b, a, filtered)


	#TODO: removing heartbeat artifacts...
	#applying ricker
	# widths = np.arange(1, 50)
	# cwtmatr = signal.cwt(data,signal.ricker, widths)
	# data = data - cwtmatr


	#applying bandpass filter, 0.5 - 8 Hz
	filter_order = 1
	# critical_frequencies = [15, 50] #in Hz
	critical_frequencies =[ 0.5, 8] 	# in Hz
	FILTER = 'bandpass'				#'bandpass'
	output = 'sos'

	#design butterworth bandpass filter
	sos = signal.butter(filter_order, critical_frequencies, FILTER, fs = sampling_frequency, output= output)
	filtered = signal.sosfilt(sos, data)
			

	return filtered

data = []
label = []
for i in range(len(total_data)):					#gives the number of file
	for j in range(len(total_data[i])):				#choosing the file //as per the index it was necessary
		for k in range(len(total_data[i][j])):		#chossing the data block in the file
			for l in range(len(total_data[i][j][k][0][0,:])):
				total_data[i][j][k][0][:,l] = filter_data(total_data[i][j][k][0][:,l])	#filters all the channel data //please recheck it...
			data.append(total_data[i][j][k][0])		#recording the data 
			label.append(total_data[i][j][k][1])	#recording the label

'''
#data[data_number][sample_number, Channel_number]
#label[data_number]

data - variable to access the sampled data.
label - label of the respective recorded data.

data_number - sum of all the recorded files, a single file contains 10-20(nearly some might contain greater than 20(absent minded during recording.)) instance of records.
`				thus it reference to the total number of data available.
sample_number - number of samples recorded <rows> (variable in length due to differene in recording time)
Channel_number - number of channels i.e. 8 <column>
'''

#visulaize the signals
import matplotlib.pyplot as plt 
plt.plot(data[0])
plt.show()


#applying ricker
# widths = np.arange(1, 50)
# cwtmatr = signal.cwt(data[0][:,0],signal.ricker, widths)
# plt.imshow(cwtmatr)
# plt.show()

# TODO 
#feature extraction
#use the model made
#train and test


'''
source :
https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.butter.html
https://docs.scipy.org/doc/scipy/reference/generated/scipy.signal.iirnotch.html

'''