% Program to perform STFT Framing and deframing
close all;
clear all;
clc;

% Read Clean Speech Signal 
fid = fopen('clean.wav','r');
speech=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);

% Define Parameters
fs =8000; % Sampling frequency
SegmentStep=fs*.025; % Frame length
Overlap=fs*.015; % % of overlab
SegmentLength=SegmentStep+Overlap; % SEgment length
SpeechLength=length(speech); % Length of spech signal
nSegments=floor(SpeechLength/(SegmentStep))-1; % No of frame
Window=hamming(SegmentLength); % Generate Window sequence
de=hanning(2*Overlap-1)' ;
dewindow=[de(1 : Overlap), ones(1,SegmentLength-2*Overlap) de(Overlap : end)]'./Window;
recons=zeros(SpeechLength, 1);
 
% Speech framing and deframing
for i =1:nSegments
speechSegment(:,i)=speech((i-1)*SegmentStep+1: i*SegmentStep+Overlap);
speechW(:,i)=Window.*speechSegment(:,i);
speechde(:,i)=speechW(:,i).*dewindow;
recons((i-1)*SegmentStep+1:i*SegmentStep+Overlap) = speechde(:,i)+recons((i-1)*SegmentStep+1:i*SegmentStep+Overlap);
end

% Plot the speech and reconstructed speech
 figure(1); plot(speech);
 figure(2); plot(recons);
 
% Performance Measure
MSE = (sum((speech-recons).^2))/length(speech)