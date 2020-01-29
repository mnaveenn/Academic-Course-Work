clear all;
close all;
clc;
tic;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 fid = fopen('IEEEFemale.wav','r');
 speech=fread(fid, inf, 'int16', 0, 'ieee-le');
 fclose(fid);
 
 
 fid = fopen('speechshapednoise.wav','r');
 noise=fread(fid, inf, 'int16', 0, 'ieee-le');
 fclose(fid);

 
fs = 8000; 
SNR = 5; 
LC = 0;  
numChan = 128; 
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

for i = 1:winLength    
    coswin(i) = (1 + cos(2*pi*(i-1)/winLength - pi))/2;
end

%gL = 1024;     
for c=1:numChan
    for m = 1:numFrame
    mask(c,m) = cs(c,m) >= cn(c,m)*10^(LC/10);
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for c = 1:numChan
    
    midEarCoeff(c) = 10^((loudness(cf(c))-60)/20);  
    
    z(c) = nnz(mask(c,:));
    z(c)=(z(c)/numFrame)*100;
    if ((z(c)>=0)&&(z(c)<=10))
        gL=512;
    elseif ((z(c)>10)&&(z(c)<30))
        gL=512;
    elseif ((z(c)>30)&&(z(c)<=100))
        gL=512;        
    end
    tmp_t = [1:gL]/fs;
    gain = 10^((loudness(cf(c))-60)/20)/3*(2*pi*b(c)/fs).^4;   
    gt = gain*fs^3*tmp_t.^(filterOrder-1).*exp(-2*pi*b(c)*tmp_t).*cos(2*pi*cf(c)*tmp_t+phase(c));
    weight = zeros(1, sigLength);      
    for m = 1:numFrame-increment/2+1                
        startpoint = (m-1)*winShift;
        if m <= increment/2               
            weight(1:startpoint+winLength/2) = weight(1:startpoint+winLength/2) + mask(c,m)*coswin(winLength/2-startpoint+1:end);
        else 
            weight(startpoint-winLength/2+1:startpoint+winLength/2) = weight(startpoint-winLength/2+1:startpoint+winLength/2) + mask(c,m)*coswin;
        end
    end
    temp1(c,:) = gns(c,:).*weight;
    temp1(c,:) = fliplr(temp1(c,:))/midEarCoeff(c);   
    temp2 = fftfilt(gt,temp1(c,:));   
    temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);    
    
    rs = rs + temp1(c,:);
end

AllOneMask=zeros(numChan, numFrame);
AllOneMask(:,:)=1;


winLength1=160;
sigLength1 = length(gs);
winShift1 = winLength1/2;     
increment1 = winLength1/winShift1;     
r1 = zeros(1,sigLength1);
filterOrder = 4;     
[numChan1, numFrame1] = size(AllOneMask);
phase(1:numChan1) = zeros(numChan1,1);        
erb_b = hz2erb(fRange);       
erb = [erb_b(1):diff(erb_b)/(numChan1-1):erb_b(2)];    
cf = erb2hz(erb);       
b = 1.019*24.7*(4.37*cf/1000+1);      
temp11 = zeros(numChan1, sigLength1);
midEarCoeff1 = zeros(1,numChan1);     


for i = 1:winLength1     
    coswin(i) = (1 + cos(2*pi*(i-1)/winLength1 - pi))/2;
end


for c = 1:numChan1
    z1(c) = nnz(mask(c,:));
    z1(c)=(z1(c)/numFrame)*100;
    if ((z1(c)>=0)&&(z(c)<=10))
        gL1=512;
    elseif ((z(c)>10)&&(z(c)<30))
        gL1=512;
    elseif ((z(c)>30)&&(z(c)<=100))
        gL1=512;        
    end
    tmp_t = [1:gL1]/fs;
    gain = 10^((loudness(cf(c))-60)/20)/3*(2*pi*b(c)/fs).^4;   
    gt1 = gain*fs^3*tmp_t.^(filterOrder-1).*exp(-2*pi*b(c)*tmp_t).*cos(2*pi*cf(c)*tmp_t+phase(c));
    midEarCoeff1(c) = 10^((loudness(cf(c))-60)/20);
    weight1 = zeros(1, sigLength1);      
    for m = 1:numFrame1-increment1/2+1              
        startpoint1 = (m-1)*winShift1;
        if m <= increment1/2                
            weight1(1:startpoint1+winLength1/2) = weight1(1:startpoint1+winLength1/2) + AllOneMask(c,m)*coswin(winLength1/2-startpoint1+1:end);
        else 
            weight1(startpoint1-winLength1/2+1:startpoint1+winLength1/2) = weight1(startpoint1-winLength1/2+1:startpoint1+winLength1/2) + AllOneMask(c,m)*coswin;
        end
    end
    
    temp11(c,:) = gs(c,:).*weight1;
    
    temp11(c,:) = fliplr(temp11(c,:))/midEarCoeff1(c);    
    temp21 = fftfilt(gt1,temp11(c,:));   
    temp11(c,:) = fliplr(temp21(1:sigLength1))/midEarCoeff1(c);  
    
    r1 = r1 + temp11(c,:);
end

SNR = 10*log10(sum(r1.^2)/sum((r1-rs).^2));
disp(SNR);
toc;

