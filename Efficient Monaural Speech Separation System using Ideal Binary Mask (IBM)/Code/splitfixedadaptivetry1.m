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
 
SNR = 5; 
  
numChan = 64;
  
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

[gs, gn, gns, gt512, midEarCoeff] = adaptivefixedanalysisfilterbank(speech, scalednoise, noisyspeech, numChan, ls);

mask = maskcomputation(gs, gn, winLength);

synthesiedspeech = maskmultiplicationandadaptivefixedsynthesis(gns, winLength, midEarCoeff, gt512, mask);

AllOneMask=zeros(numChan, 275);
AllOneMask(:,:)=1;

speechAllOne = maskmultiplicationandadaptivefixedsynthesis(gs,winLength, midEarCoeff, gt512, AllOneMask);

SNR = 10*log10(sum(speechAllOne.^2)/sum((speechAllOne-synthesiedspeech).^2));
disp(SNR);

toc; 
 
 
 
 
 
 
 
 
 
 
 
 