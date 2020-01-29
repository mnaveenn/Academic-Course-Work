
% This program performs Analysis and Synthesis using Gamma tone filter bank
clear all
close all
clc;
%tic;

% Read Clean Speech Signal 
%-------------------------------------------------------------------------
fid = fopen('clean.wav','r');
speech=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);
%soundsc(speech,8000);  % The sky that morning was clear and bright blue

% Define Parameters
% -------------------------------------------------------------------------
filterOrder = 4;
gL = 1024;
numChan = 128;
fs = 8000;
fRange = [80, 4000];

% Pre-processing for filter design
% -------------------------------------------------------------------------
sigLength = length(speech);
phase(1:numChan) = zeros(numChan, 1);
erb_b = hz2erb(fRange);
erb = [erb_b(1):diff(erb_b)/(numChan-1):erb_b(2)];
cf = erb2hz(erb);
b = 1.019*24.7*(4.37*cf/1000+1);

% Generating Gammatone impulse responces - Analysis Part
% -------------------------------------------------------------------------
gt = zeros(numChan, gL);
tmp_t = [1:gL]/fs;
for i = 1:numChan
    gain = 10^((loudness(cf(i))-60)/20)/3*(2*pi*b(i)/fs).^4;
    gt(i,:)=gain*fs^3*tmp_t.^(filterOrder-1).*exp(-2*pi*b(i)*tmp_t).*cos(2*pi*cf(i)*tmp_t+phase(i));
end
sig = reshape(speech, sigLength, 1);
r = fftfilt(gt', repmat(sig, 1, numChan))';

% Reconstructing the signal using Gammatone Filter bank - Synthesis Part
% -------------------------------------------------------------------------
Recon = zeros(1, sigLength);
midEarCoeff = zeros(1, numChan);
for c = 1:numChan
    midEarCoeff(c) = 10^((loudness(cf(c))-60)/20);
end
for c = 1:numChan
    temp1(c,:) = fliplr(r(c,:))/midEarCoeff(c);
    temp2 = fftfilt(gt(c,:),temp1(c,:));
    temp1(c,:)=fliplr(temp2(1:sigLength))/midEarCoeff(c);
    Recon = Recon+temp1(c,:);
end
%soundsc(Recon,8000);
figure(1); plot(speech);
figure(2); plot(Recon);
% Performance Measure
% -------------------------------------------------------------------------
MSE = (sum((speech-Recon').^2))/length(speech)




