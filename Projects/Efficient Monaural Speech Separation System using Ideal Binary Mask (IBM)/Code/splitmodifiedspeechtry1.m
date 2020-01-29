clear all
close all
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
  
numChan = 64;
fRange = [80, 4000];  
winLength = 160; 
ls = length(speech);
ln = length(noise);
if(ls >= ln)  
    speech = speech(1:ln);
    ls=ln;
else
    noise = noise(1:ls);
    ln=ls;
end

change = 20*log10(std(speech)/std(noise))-SNR;
scalednoise = noise*10^(change/20);
noisyspeech = speech+scalednoise;

gL = 512;


[gs, gn, gns, gt, midEarCoeff] = analysisfilterbank(speech, scalednoise, noisyspeech, numChan, fs, fRange, gL, ls);

mask = maskcomputation(gs, gn, winLength);

synthesiedspeech = maskmultiplicationandsynthesis(gns, winLength, midEarCoeff, gt, mask);

AllOneMask=zeros(numChan, 275);
AllOneMask(:,:)=1;

speechAllOne = maskmultiplicationandsynthesis(gs,winLength, midEarCoeff, gt, AllOneMask);

SNR = 10*log10(sum(speechAllOne.^2)/sum((speechAllOne-synthesiedspeech).^2));
disp(SNR);

toc; 
 
 
 
 
 
 
 
 
 
 
 
 