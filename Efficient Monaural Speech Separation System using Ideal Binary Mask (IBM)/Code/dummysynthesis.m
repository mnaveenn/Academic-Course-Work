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
noisyspeech = speech+scalednoise;

% T-F Analysis (Gammatone Filtering and Cochleagram)
% -------------------------------------------------------------------------
[gs, GMTimpgs] = gammatoneIBM(speech, numChan, fRange, fs); % Gammatone filtering of speech that returns filtered response and its impulse response
[gn, GMTimpgn] = gammatoneIBM(scalednoise, numChan, fRange, fs);

% hs = meddis(gs, fs);
% hn = meddis(gn, fs);
% cs = cochleagram(hs, winLength); % Cochleagram of the Gammatone filtered response
% cn = cochleagram(hn, winLength);

cs = cochleagram(gs, winLength); % Cochleagram of the Gammatone filtered response
cn = cochleagram(gn, winLength);

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

filterOrder = 4;     % filter order
winShift = winLength/2;     % frame shift rate (default is 1/2 frame length)
increment = winLength/winShift;     % special treatment for beginning frames
sigLength = length(noisyspeech);
r = zeros(1,sigLength);
[numChan,numFrame] = size(mask);     % number of channels and time frames

for i = 1:winLength     % calculate a raised cosine window
    coswin(i) = (1 + cos(2*pi*(i-1)/winLength - pi))/2;
end

temp1 = gammatoneIBM(noisyspeech, numChan, fRange, fs);          % first pass through gammatone filterbank

phase(1:numChan) = zeros(numChan,1);        % initial phases
erb_b = hz2erb(fRange);       % upper and lower bound of ERB
erb = [erb_b(1):diff(erb_b)/(numChan-1):erb_b(2)];     % ERB segment
cf = erb2hz(erb);       % center frequency array indexed by channel
b = 1.019*24.7*(4.37*cf/1000+1);       % rate of decay or bandwidth

midEarCoeff = zeros(1,numChan);     % frequency-dependent mid-ear coefficients
for c = 1:numChan
    midEarCoeff(c) = 10^((loudness(cf(c))-60)/20);
end

% Generating gammatone impulse responses with middle-ear gain normalization
gL = 1024;      % gammatone filter length or 128 ms for 16 kHz sampling rate
gt = zeros(numChan,gL);
tmp_t = [1:gL]/fs;
for c = 1:numChan
    gain = 10^((loudness(cf(c))-60)/20)/3*(2*pi*b(c)/fs).^4;    % loudness-based gain adjustments
    gt(c,:) = gain*fs^3*tmp_t.^(filterOrder-1).*exp(-2*pi*b(c)*tmp_t).*cos(2*pi*cf(c)*tmp_t+phase(c));
end

        % used in second path gammatone filtering
for c = 1:numChan
    temp1(c,:) = fliplr(temp1(c,:))/midEarCoeff(c);    % time reverse filter output & normalize out mid-ear coefficients
    temp2 = fftfilt(gt(c,:),temp1(c,:));    % second pass filtering via FFTFILT
    temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);    % time reverse again & normalize out mid-ear coefficients
    
    weight = zeros(1, sigLength);       % calculate weighting
    for m = 1:numFrame-increment/2+1      % mask value can be binary or rational           
        startpoint = (m-1)*winShift;
        if m <= increment/2                % shorter frame lengths for beginning frames or zero padding
            weight(1:startpoint+winLength/2) = weight(1:startpoint+winLength/2) + mask(c,m)*coswin(winLength/2-startpoint+1:end);
        else 
            weight(startpoint-winLength/2+1:startpoint+winLength/2) = weight(startpoint-winLength/2+1:startpoint+winLength/2) + mask(c,m)*coswin;
        end
    end
    
    r = r + temp1(c,:).*weight;
end
synthesiedspeech=r;
AllOneMask=zeros(numChan, numFrame);
AllOneMask(:,:)=1;
speechAllOne = synthesis(speech, AllOneMask, fRange, winLength, fs);
%soundsc(speechAllOne,8000);

SNR = 10*log10(sum(speechAllOne.^2)/sum((speechAllOne-synthesiedspeech).^2));
disp(SNR);
% xlswrite('SNR_babblenoise_10dB', SNR); 
toc;
  load handel.mat
  filename = 'handel.wav';
  audiowrite(filename,synthesiedspeech,8000);
