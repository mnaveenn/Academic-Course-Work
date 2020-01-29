% This program performs monaural speech separation using IBM where mask is multiplied before windowing with the function synthesisModified()
clear all
close all
clc;
tic;
% Read Clean Speech Signal 
%-------------------------------------------------------------------------
fid = fopen('IEEEFemale.wav','r');
speech=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);
%  speech=speech(3000:3160);
%soundsc(speech,8000);  % The sky that morning was clear and bright blue
% Read Babble Noise Signal 
%-------------------------------------------------------------------------
fid = fopen('speechshapednoise.wav','r');
noise=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);
% noise=noise(3000:3160);
%soundsc(noise,8000);
 
% Compute IBM Mask 
%-------------------------------------------------------------------------
fs = 8000; % Sampling frequency used in signal and noise found using wavread command
SNR = 5; % Desired Signal to Noise Ratio
LC = 0;   % Local SNR Criterian in IBM Estimation
numChan = 64;
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

% T-F Analysis (Gammatone Filtering and Cochleagram)
% -------------------------------------------------------------------------
[gs, GMTimpgs] = gammatoneIBM(speech, numChan, fRange, fs); % Gammatone filtering of speech that returns filtered response and its impulse response
[gn, GMTimpgn] = gammatoneIBM(scalednoise, numChan, fRange, fs);
[gns, GMTimpgns] = gammatoneIBM(noisyspeech, numChan, fRange, fs);
% hs = meddis(gs, fs);
% hn = meddis(gn, fs);
% cs = cochleagram(hs, winLength); % Cochleagram of the Gammatone filtered response
% cn = cochleagram(hn, winLength);

cs = cochleagram(gs, winLength); % Cochleagram of the Gammatone filtered response
cn = cochleagram(gn, winLength);
%cns = cochleagram(gns, winLength);
% % Cochleagram Plot of Speech and Noise 
%   figure(1); cochplot(cs, fRange);
%   figure(2); cochplot(cn, fRange);

% Computing IBM for Speech Separation
% -------------------------------------------------------------------------
[numChan, numFrame] = size(cs);
mask = zeros(size(cs));

for c = 1:numChan
    for m = 1:numFrame
        mask(c,m) = cs(c,m) >= cn(c,m)*10^(LC/10);
    end
end

% Synthesis the speech signal
%-------------------------------------------------------------------------
synthesiedspeech = synthesisModified(gns, mask, fRange, winLength, fs);
%synthesiedspeech = synthesisModified(gns, mask, fRange, winLength, fs);
% Quality Measures Computation
% -------------------------------------------------------------------------

% 1. SNR Improvement
% -----------------------
% sig = ibm(speech);
AllOneMask=zeros(numChan, numFrame);
AllOneMask(:,:)=1;
speechAllOne = synthesisModified(gs, AllOneMask, fRange, winLength, fs);
%speechAllOne = synthesisModified(gs, AllOneMask, fRange, winLength, fs);
%soundsc(speechAllOne,8000);

SNR = 10*log10(sum(speechAllOne.^2)/sum((speechAllOne-synthesiedspeech).^2));
disp(SNR);

toc;