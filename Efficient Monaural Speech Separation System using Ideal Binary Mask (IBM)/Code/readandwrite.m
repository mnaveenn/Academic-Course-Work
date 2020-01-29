% This program performs monaural speech separation using IBM
clear all
close all
clc;
tic;
% Read Clean Speech Signal 
%-------------------------------------------------------------------------
fid = fopen('IEEEFemale.wav','r');
speech=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);
%soundsc(speech,8000);  % The sky that morning was clear and bright blue
 
% Read Babble Noise Signal 
%-------------------------------------------------------------------------
fid = fopen('speechshapednoise.wav','r');
noise=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);
%figure();
%plot(speech)
%figure();
%plot(noise)
 
% Compute IBM Mask 
%-------------------------------------------------------------------------
fs = 8000; % Sampling frequency used in signal and noise found using wavread command
SNR = 30; % Desired Signal to Noise Ratio
LC = 0;   % Local SNR Criterian in IBM Estimation
numChan = 128;
fRange = [80, 4000];  
winLength = 160; %Corresponds to 20 ms of overlapping
ls = length(speech);
ln = length(noise);
if(ls >= ln)  % Make the length of speech and noise equal
    speech = speech(1:ln);
else
    noise = noise(1:ls);
end

% Scale the noise such that speech+noise = noisyspeech at the desired SNR
% -----------------------------------------------------------------------
change = 20*log10(std(speech)/std(noise))-SNR;
scalednoise = noise*10^(change/20);
noisyspeech = speech+scalednoise;


