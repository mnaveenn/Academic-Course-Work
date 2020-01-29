clear all
close all
clc;
tic;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 fid = fopen('IEEEFemale.wav','r');
 speech=fread(fid, inf, 'int16', 0, 'ieee-le');
 fclose(fid);
 
 
 fid = fopen('speechshapednoise.wav','r');
 noise=fread(fid, inf, 'int16', 0, 'ieee-le');
 fclose(fid);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  [speech,Fs1]=audioread('clean.wav');
%  [noise,Fs]=audioread('speechshapednoise.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
fs = 8000; 
SNR = 0; 
LC = 0;  
numChan = 128;
gL = 1024;
fRange = [80, 4000];  
winLength = 160; 
ls = length(speech);
ln = length(noise);
if(ls >= ln)  
    speech = speech(1:ln);
else
    noise = noise(1:ls);
end

change = 20*log10(std(speech)/std(noise))-SNR;
scalednoise = noise*10^(change/20);
noisyspeech = speech+scalednoise;

[gs, GMTimpgs] = gammatoneIBM(speech, numChan, fRange, fs); 
[gn, GMTimpgn] = gammatoneIBM(scalednoise, numChan, fRange, fs);
[gns, GMTimpgns] = gammatoneIBM(noisyspeech, numChan, fRange, fs);


cs = cochleagram(gs, winLength); 
cn = cochleagram(gn, winLength);
[numChan, numFrame] = size(cs);
mask = zeros(size(cs));

for c = 1:numChan
    
    for m = 1:numFrame
        mask(c,m) = cs(c,m) >= cn(c,m)*10^(LC/10);
    end
    
end



sigLength = length(gns);
winShift = winLength/2;     
increment = winLength/winShift;     
rs = zeros(1,sigLength);
filterOrder = 4;     
[numChan, numFrame] = size(mask);
phase(1:numChan) = zeros(numChan,1);  

erb_b = hz2erb(fRange);      
erb = [erb_b(1):diff(erb_b)/(numChan-1):erb_b(2)];    
cf = erb2hz(erb);      
b = 1.019*24.7*(4.37*cf/1000+1);       
temp1 = zeros(numChan, sigLength);
midEarCoeff = zeros(1,numChan);     
for c = 1:numChan
    midEarCoeff(c) = 10^((loudness(cf(c))-60)/20);
end

%gL = 128;     
gt = zeros(numChan,gL);
tmp_t = [1:gL]/fs;
for c = 1:numChan
    gain = 10^((loudness(cf(c))-60)/20)/3*(2*pi*b(c)/fs).^4;   
    gt(c,:) = gain*fs^3*tmp_t.^(filterOrder-1).*exp(-2*pi*b(c)*tmp_t).*cos(2*pi*cf(c)*tmp_t+phase(c));
end

for i = 1:winLength    
    coswin(i) = (1 + cos(2*pi*(i-1)/winLength - pi))/2;
end

for c = 1:numChan
    weight = zeros(1, sigLength);      
    for m = 1:numFrame-increment/2+1                
        startpoint = (m-1)*winShift;
        if m <= increment/2               
            weight(1:startpoint+winLength/2) = weight(1:startpoint+winLength/2) + mask(c,m).*coswin(winLength/2-startpoint+1:end);
        else 
            weight(startpoint-winLength/2+1:startpoint+winLength/2) = weight(startpoint-winLength/2+1:startpoint+winLength/2) + mask(c,m)*coswin;
        end
    end
    
    temp1a(c,:) = gns(c,:).*weight;
    
    temp1b(c,:) = fliplr(temp1a(c,:))/midEarCoeff(c);   
    temp2 = fftfilt(gt(c,:),temp1b(c,:));   
    temp3(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);    
    
    rs = rs + temp3(c,:);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AllOneMask=zeros(numChan, numFrame);
AllOneMask(:,:)=1;
    
r1 = zeros(1,sigLength);

temp = zeros(numChan, sigLength);
      
gt = zeros(numChan,gL);
tmp_t = [1:gL]/fs;
for c = 1:numChan
    gain = 10^((loudness(cf(c))-60)/20)/3*(2*pi*b(c)/fs).^4;    
    gt(c,:) = gain*fs^3*tmp_t.^(filterOrder-1).*exp(-2*pi*b(c)*tmp_t).*cos(2*pi*cf(c)*tmp_t+phase(c));
end




for c = 1:numChan
    weight1 = zeros(1, sigLength);      
    for m = 1:numFrame-increment/2+1              
        startpoint = (m-1)*winShift;
        if m <= increment/2                
            weight1(1:startpoint+winLength/2) = weight1(1:startpoint+winLength/2) + AllOneMask(c,m)*coswin(winLength/2-startpoint+1:end);
        else 
            weight1(startpoint-winLength/2+1:startpoint+winLength/2) = weight1(startpoint-winLength/2+1:startpoint+winLength/2) + AllOneMask(c,m)*coswin;
        end
    end
    
    temp1(c,:) = gs(c,:).*weight1;
    
    temp1(c,:) = fliplr(temp1(c,:))/midEarCoeff(c);    
    temp2 = fftfilt(gt(c,:),temp1(c,:));   
    temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);  
    
    r1 = r1 + temp1(c,:);
end

SNR = 10*log10(sum(r1.^2)/sum((r1-rs).^2))
toc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%  load handel.mat
%  filename = 'handles.wav';
%  audiowrite(filename,rs,8000);

a=1;
t=22004;
speech = reshape(speech,[1,t]);
noisyspeech = reshape(noisyspeech,[1,t]);
figure()
plot(speech(a:t),'b-');
xlabel('Time-->');
ylabel('Amplitude-->');
title('Input Speech: The sky that morning was clear and bright blue');
figure()
plot(noise(a:t),'b-');
xlabel('Time-->');
ylabel('Amplitude-->');
title('Graphical Representation of Noise');
figure()
plot(noisyspeech(a:t),'b-');
xlabel('Time-->');
ylabel('Amplitude-->');
title('Noisyspeech at SNR = 5db');
figure()
plot(rs(a:t),'b-');
xlabel('Time-->');
ylabel('Amplitude-->');
title('Resynthesized Speech using Proposed System');
k = stoi(rs,speech,8000)