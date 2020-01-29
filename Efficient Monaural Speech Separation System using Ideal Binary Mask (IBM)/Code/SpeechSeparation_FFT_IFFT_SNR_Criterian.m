% This program performs monaural speech separation using SNR Channel selection criteria and FFT-IFFT Combination
clear all
close all
clc;
%tic;

% Important variable declarations
%--------------------------------------------------------------------------
fs = 8000; % Sampling frequency used in signal and noise found using wavread command
SNR = 15; % Desired Signal to Noise Ratio
LC = 0;   % Local SNR Criterian or Masking threshold in dB


% Read Clean Speech Signal 
%-------------------------------------------------------------------------
fid = fopen('clean.wav','r');
speech=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);
speech = speech-mean(speech);  %c1=speech
%soundsc(speech,8000);  % The sky that morning was clear and bright blue

% Read Babble Noise Signal 
%-------------------------------------------------------------------------
fid = fopen('babble.wav','r');
noise=fread(fid, inf, 'int16', 0, 'ieee-le');
fclose(fid);
noise = noise-mean(noise); % n=noise
%soundsc(noise,8000);

% Make the length of signal and noise equal
%--------------------------------------------------------------------------
ls = length(speech);
ln = length(noise);
if(ls >= ln)  % Make the length of speech and noise equal
    speech = speech(1:ln);
else
    noise = noise(1:ls);
end

% Scale the noise file to get required SNR
%--------------------------------------------------------------------------
SigE=norm(speech,2)^2; %... signal energy
nsc=SigE/(10^(SNR/10));
NoiE=norm(noise,2)^2;  % noise energy
noise=sqrt(nsc/NoiE)*noise; % scale noise energy to get required SNR
NoiE=norm(noise,2)^2;
fprintf('Estimated SNR=%f\n',10*log10(SigE/NoiE));
Noisyspeech = speech + noise;    % the noisy signal
wavwrite(Noisyspeech,fs,16,'Noisyspeech.wav');

% Initialize variables 
%--------------------------------------------------------------------------
len = floor(20*fs/1000); % Frame size in samples
if rem(len,2)==1, len=len+1; end;
PERC = 50; % window overlap in percent of frame size
len1 = floor(len*PERC/100);
len2 = len-len1;
win = hanning(len);
nFFT = len;
nFFT2=round(nFFT/2);

% Allocate memory and initialize various variables
%--------------------------------------------------------------------------
Nframes = floor(length(Noisyspeech)/len2)-1;
Signalfinal = zeros(Nframes*len2,1);

%  Masking threshold
%--------------------------------------------------------------------------
thrd = 10^(LC/10);

%  Start Processing   
%--------------------------------------------------------------------------
k = 1;
x_old = zeros(len1,1);
BMask=zeros(Nframes,nFFT2);
for i = 1:Nframes

    insign = win.*x(k:k+len-1);  % noisy signal
    cl_sign = win.*cl(k:k+len-1);  % clean signal
    tn = win.*n(k:k+len-1);      % noise (masker)
   
    %--- Take fourier transform of  frame

    spec = fft(insign,nFFT);  % noisy speech spectrum
    sig = abs(spec); % compute the magnitude
    sig2 = sig.^2;

    cl_spec = fft(cl_sign,nFFT);  % clean speech spectrum
    cl_sig = abs(cl_spec); % compute the magnitude
    cl_sig2 = cl_sig.^2;

    tn_spec = fft(tn,nFFT);
    tn_sig = abs(tn_spec); % compute the magnitude
    tn_sig2 = tn_sig.^2;

    ksi_IEC = cl_sig2./tn_sig2;  % True instantaneous SNR
    %ksi_IEC = cl_sig2./sig2;  % True instantaneous SNR

    % binary masking

    hw = ones(len1,1);
    ind = find(ksi_IEC(1:len1)<thrd);
    hw(ind) = 0;
    BMask(i,1:nFFT2)=1-hw(1:nFFT2); 

    hw = [hw ;hw(end:-1:1)];
    xi_w = ifft( hw .* spec);   % synthesize binary-masked signal
    %xi_w = ifft( hw .* tn_spec);   % synthesize  signal by modulating mask by noise 
    xi_w = real( xi_w);

    % --- Overlap and add ---------------
    xfinal(k:k+ len2-1) = x_old+ xi_w(1:len1);
    x_old = xi_w(len1+ 1: len);
    k=k+len2;
end
%========================================================================

