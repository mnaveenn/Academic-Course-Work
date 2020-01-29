
% This program performs monaural speech separation using IBM
clear all
close all
clc;
%tic;
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
%soundsc(noise,8000);
 
% Compute IBM Mask 
%-------------------------------------------------------------------------
fs = 8000; % Sampling frequency used in signal and noise found using wavread command
SNR = 5; % Desired Signal to Noise Ratio
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

% T-F Analysis (Gammatone Filtering and Cochleagram)
% -------------------------------------------------------------------------
[gs, GMTimp] = gammatoneIBM(speech, numChan, fRange, fs); % Gammatone filtering of speech that returns filtered response and its impulse response
[gn, GMTimp] = gammatoneIBM(scalednoise, numChan, fRange, fs);

cs = cochleagram(gs, winLength); % Cochleagram of the Gammatone filtered response
cn = cochleagram(gn, winLength);

% Cochleagram Plot of Speech and Noise
figure(1); plot(speech);
figure(2); cochplot(cs, fRange);
figure(3); plot(noise);
figure(4); cochplot(cn, fRange);

% Computing IBM for Speech Separation
% -------------------------------------------------------------------------
[numChan, numFrame] = size(cs);

for c = 1:numChan
    for m = 1:numFrame
        mask(c,m) = cs(c,m) >= cn(c,m)*10^(LC/10);
    end
end
figure(5);plot(mask);
% Write Mask for future computation
dlmwrite('mask5db.out',mask);
%xlswrite('Mask_babblenoise_20dB', mask'); % Note: xlswrite can write data max of size [65536x256], but the size of mask is [128x267], so it exceeds the column range, thats what here we write mask', please revert back while processing latter.

% Signal Resynthesis using IBM Mask and noisyspeech
% -------------------------------------------------------------------------
noisyspeech = speech+scalednoise;
synthesiedspeech = synthesis(noisyspeech, mask, fRange, winLength, fs);
%soundsc(noisyspeech,8000);
%soundsc(synthesiedspeech,8000);


% Quality Measures Computation
% -------------------------------------------------------------------------

% 1. SNR Improvement
% -----------------------
% sig = ibm(speech);
AllOneMask=zeros(numChan, numFrame);
AllOneMask(:,:)=1;
speechAllOne = synthesis(speech, AllOneMask, fRange, winLength, fs);
%soundsc(speechAllOne,8000);
SNR = 10*log10(sum(speechAllOne.^2)/sum((speechAllOne-synthesiedspeech).^2));
disp(SNR);

% Normalize the Clean Speech Signal [-1 1] and write it as .wav file;
%--------------------------------------------------------------------------
maxCleanspeech = max(speechAllOne);
minCleanspeech = min(speechAllOne);
%# normalize to [-1...1]
NormalizedCleanspeech = ((speechAllOne-minCleanspeech)./(maxCleanspeech-minCleanspeech) - 0.5 ) *2;
%wavplay(NormalizedCleanspeech, fs);   % Normalized Clean Speech Signal - sp10- The sky that morning was clear and bright blue. 
% wavwrite(NormalizedCleanspeech,fs,'Cleanspeech.wav');
  load handel.mat
  filename = 'Cleanspeech.wav';
  audiowrite(filename,NormalizedCleanspeech,8000);
% Normalize the Clean Speech Signal [-1 1] and write it as .wav file;
%--------------------------------------------------------------------------
maxsynthesiedspeech = max(synthesiedspeech);
minsynthesiedspeech = min(synthesiedspeech);
%# normalize to [-1...1]
Normalizedsynthesiedspeech = ((synthesiedspeech-minsynthesiedspeech)./(maxsynthesiedspeech-minsynthesiedspeech) - 0.5 ) *2;
%wavplay(Normalizedsynthesiedspeech, fs);   % Normalized Clean Speech Signal - sp10- The sky that morning was clear and bright blue. 
% wavwrite(Normalizedsynthesiedspeech,fs,'Enhancedspeech.wav');
  load handel.mat
  filename = 'Enhancedspeech.wav';
  audiowrite(filename,Normalizedsynthesiedspeech,8000);
% 2. SNR Measurement as per the program given in Book
% -------------------------------------------------------------------------
% [snr_mean, segsnr_mean]= comp_snr('Cleanspeech.wav', 'Enhancedspeech.wav');
% disp(snr_mean);

% 3. PESQ Measurement (BOOK)
% -------------------------------------------------------------------------
PESQ = pesq('Cleanspeech.wav', 'Enhancedspeech.wav');
disp(PESQ);

% figure(1); cochplot(cs, fRange, 10);
% figure(2); cochplot(cn, fRange, 10);
% [gns] = gammatoneIBM(noisyspeech, numChan, fRange, fs); % Gammatone filtering of speech that returns filtered response and its impulse response
% cns = cochleagram(gns, winLength); % Cochleagram of the Gam
% figure(3); cochplot(cns, fRange, 10);
% [ges] = gammatoneIBM(synthesiedspeech, numChan, fRange, fs); % Gammatone filtering of speech that returns filtered response and its impulse response
% ces = cochleagram(ges, winLength); % Cochleagram of the Gam
% figure(4); cochplot(ces, fRange, 10);

% %toc;