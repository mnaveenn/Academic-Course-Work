clear all;
close all;
clc;
tic;
fid = fopen('IEEEFemale.wav','r');
speech=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);
 
 
fid = fopen('speechshapednoise.wav','r');
noise=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);

fs = 8000; 
SNR = 5; 
LC = 0;  
numChan = 64;
gL1= 512;  
fRange = [80, 4000];  
winLength = 160;

ls = length(speech);
ln = length(noise);
if(ls >= ln)  
    speech = speech(1:ln);
else
    noise = noise(1:ls);
end

sigLength = length(speech);

change = 20*log10(std(speech)/std(noise))-SNR;
scalednoise = noise*10^(change/20);
noisyspeech = speech+scalednoise;

filterOrder = 4; 
gL = 512; 

phase(1:numChan) = zeros(numChan,1);  
erb_b = hz2erb(fRange); 
erb = [erb_b(1):diff(erb_b)/(numChan-1):erb_b(2)];
cf = erb2hz(erb);
b = 1.019*24.7*(4.37*cf/1000+1);

gt = zeros(numChan,gL);
tmp_t = [1:gL]/fs;
for i = 1:numChan
    gain = 10^((loudness(cf(i))-60)/20)/3*(2*pi*b(i)/fs).^4; 
    gt(i,:) = gain*fs^3*tmp_t.^(filterOrder-1).*exp(-2*pi*b(i)*tmp_t).*cos(2*pi*cf(i)*tmp_t+phase(i));
end

sig = reshape(speech,sigLength,1);
r = fftfilt(gt',repmat(sig,1,numChan))';

toc;




