% This program performs filtering of speech signal
clear all
close all
clc;
%tic;
% Read Clean Speech Signal 
%-------------------------------------------------------------------------
fid = fopen('clean.wav','r');
speech=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);
soundsc(speech)

% Define the filter coefficient and perform filtering of the whole signal
% ------------------------------------------------------------------------
h = [1, -0.9375];
y = conv(speech,h);
soundsc(y);

% Windowing the speech and perform filtering 
% ------------------------------------------------------------------------
w = 240; %240 samples = 30ms of data with fs=8000
n = floor(length(speech)/w);
outspeech = zeros(1,length(speech));
for k=1:n
    seg = speech(1+(k-1)*w:k*w);
    segf = conv(seg, h);
    outsp(1+(k-1)*w:k*w+1)=segf';
end
soundsc(outsp);