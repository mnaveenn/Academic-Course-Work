function varargout = Fourth_review(varargin)
% FOURTH_REVIEW MATLAB code for Fourth_review.fig
%      FOURTH_REVIEW, by itself, creates a new FOURTH_REVIEW or raises the existing
%      singleton*.
%
%      H = FOURTH_REVIEW returns the handle to a new FOURTH_REVIEW or the handle to
%      the existing singleton*.
%
%      FOURTH_REVIEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FOURTH_REVIEW.M with the given input arguments.
%
%      FOURTH_REVIEW('Property','Value',...) creates a new FOURTH_REVIEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Fourth_review_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Fourth_review_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fourth_review

% Last Modified by GUIDE v2.5 01-Mar-2018 08:42:43

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fourth_review_OpeningFcn, ...
                   'gui_OutputFcn',  @Fourth_review_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT
end

% --- Executes just before Fourth_review is made visible.
function Fourth_review_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Fourth_review (see VARARGIN)

% Choose default command line output for Fourth_review
handles.output = hObject;
clc;
axes(handles.axes2);
imshow('images.png');
axes(handles.axes3);
imshow('images.png');
axes(handles.axes4);
imshow('images.png');
axes(handles.axes5);
imshow('images.png');
guidata(hObject, handles);
end
% UIWAIT makes Fourth_review wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fourth_review_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end

% --- Executes on selection change in popupmenu_nocmc.
function popupmenu_nocmc_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_nocmc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_nocmc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_nocmc
end

% --- Executes during object creation, after setting all properties.
function popupmenu_nocmc_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_nocmc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

SNR = get(handles.slider1,'Value');
SNR1 = strcat('Input SNR = ', num2str(SNR) , 'dB');
set(handles.input_snr,'String', SNR1);

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

end
% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
end

% --- Executes on button press in pushbutton_ns.
function pushbutton_ns_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

option1 = get(handles.radiobutton1, 'Value');
option2 = get(handles.radiobutton2, 'Value');

if option1 == 1
    
[speech,Fs1]=audioread('IEEEFemale.wav');
[noise,Fs]=audioread('speechshapednoise.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs = 8000;
SNR = get(handles.slider1,'Value');
LC = 0; 
a = get(handles.popupmenu_nocmc, 'Value');
if a==1
    numChan = 128;
elseif a==2
    numChan = 64;
elseif a==3
    numChan = 32;
end
b = get(handles.popupmenu_nocafb, 'Value');
if b==1
    gLn = 1024;
elseif b==2
    gLn = 512;
elseif b==3
    gLn = 256;
end
c = get(handles.popupmenu_nocsfb, 'Value');
if c==1
    gL = 1024;
elseif c==2
    gL = 512;
elseif c==3
    gL = 256;
end

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
soundsc(noisyspeech);
axes(handles.axes1);
plot(noisyspeech);
xlabel('Time ---->');
ylabel('Amplitude ---->');
title('Noisy Speech');   
elseif option2 == 1
        
[speech,Fs1]=audioread('IEEEFemale.wav');
[noise,Fs]=audioread('speechshapednoise.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
fs = 8000; 
SNR = get(handles.slider1,'Value'); 
LC = 0;  
a = get(handles.popupmenu_nocmc, 'Value');
if a==1
    numChan = 128;
elseif a==2
    numChan = 64;
elseif a==3
    numChan = 32;
end
b = get(handles.popupmenu_nocafb, 'Value');
if b==1
    gLn = 1024;
elseif b==2
    gLn = 512;
elseif b==3
    gLn = 256;
end
c = get(handles.popupmenu_nocsfb, 'Value');
if c==1
    gL = 1024;
elseif c==2
    gL = 512;
elseif c==3
    gL = 256;
end
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
soundsc(noisyspeech);
axes(handles.axes1);
plot(noisyspeech);
xlabel('Time ---->');
ylabel('Amplitude ---->');
title('Noisy Speech'); 
end
end



% --- Executes on button press in pushbutton_dns.
function pushbutton_dns_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_dns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%Denoised of Weintraub System
option1 = get(handles.radiobutton1, 'Value');
option2 = get(handles.radiobutton2, 'Value');

if option1 == 1
    
[speech,Fs1]=audioread('IEEEFemale.wav');
[noise,Fs]=audioread('speechshapednoise.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fs = 8000;
SNR = get(handles.slider1,'Value'); 
LC = 0; 
a = get(handles.popupmenu_nocmc, 'Value');
if a==1
    numChan = 128;
elseif a==2
    numChan = 64;
elseif a==3
    numChan = 32;
end
b = get(handles.popupmenu_nocafb, 'Value');
if b==1
    gLa = 1024;
elseif b==2
    gLa = 512;
elseif b==3
    gLa = 256;
end
c = get(handles.popupmenu_nocsfb, 'Value');
if c==1
    gL = 1024;
elseif c==2
    gL = 512;
elseif c==3
    gL = 256;
end
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

[gs, GMTimpgs] = gammatoneIBMnew(speech, numChan, fRange, fs, gLa);
[gn, GMTimpgn] = gammatoneIBMnew(scalednoise, numChan, fRange, fs, gLa);

cs = cochleagram(gs, winLength);
cn = cochleagram(gn, winLength);

[numChan, numFrame] = size(cs);
mask = zeros(size(cs));
for c = 1:numChan
    for m = 1:numFrame
        mask(c,m) = cs(c,m) >= cn(c,m)*10^(LC/10);
    end
end

filterOrder = 4;
winShift = winLength/2;
increment = winLength/winShift;
[numChan,numFrame] = size(mask);
sigLength = length(noisyspeech);
r = zeros(1,sigLength);

for i = 1:winLength 
    coswin(i) = (1 + cos(2*pi*(i-1)/winLength - pi))/2;
end

gns = gammatoneIBMnew(noisyspeech, numChan, fRange, fs, gLa);

phase(1:numChan) = zeros(numChan,1);       
erb_b = hz2erb(fRange);       
erb = [erb_b(1):diff(erb_b)/(numChan-1):erb_b(2)];    
cf = erb2hz(erb);       
b = 1.019*24.7*(4.37*cf/1000+1);     

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

for c = 1:numChan
    temp1a(c,:) = gns(c,:);
    temp1b(c,:) = fliplr(temp1a(c,:))/midEarCoeff(c);    
    temp2 = fftfilt(gt(c,:),temp1b(c,:));   
    temp3(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);    
    weight = zeros(1, sigLength);
        for m = 1:numFrame-increment/2+1                
        startpoint = (m-1)*winShift;
        if m <= increment/2               
            weight(1:startpoint+winLength/2) = weight(1:startpoint+winLength/2) + mask(c,m)*coswin(winLength/2-startpoint+1:end);
        else 
            weight(startpoint-winLength/2+1:startpoint+winLength/2) = weight(startpoint-winLength/2+1:startpoint+winLength/2) + mask(c,m)*coswin;
        end
        end
        r = r + temp3(c,:).*weight;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
AllOneMask=zeros(numChan, numFrame);
AllOneMask(:,:)=1;

winLength1=winLength;
filterOrder1 = 4;     
winShift1 = winLength1/2;     
increment1 = winLength1/winShift1;    
sigLength1 = length(speech);
r1 = zeros(1,sigLength1);
[numChan1,numFrame1] = size(AllOneMask);   

for i = 1:winLength1     
    coswin1(i) = (1 + cos(2*pi*(i-1)/winLength1 - pi))/2;
end

temp11 = gammatoneIBMnew(speech, numChan1, fRange, fs, gLa);

phase(1:numChan1) = zeros(numChan1,1);
erb_b = hz2erb(fRange);       
erb = [erb_b(1):diff(erb_b)/(numChan1-1):erb_b(2)];     
cf = erb2hz(erb);       
b = 1.019*24.7*(4.37*cf/1000+1); 

midEarCoeff1 = zeros(1,numChan1);     
for c = 1:numChan1
    midEarCoeff1(c) = 10^((loudness(cf(c))-60)/20);
end

gt1 = zeros(numChan1,gL);
tmp_t1 = [1:gL]/fs;
for c = 1:numChan1
    gain = 10^((loudness(cf(c))-60)/20)/3*(2*pi*b(c)/fs).^4;   
    gt1(c,:) = gain*fs^3*tmp_t1.^(filterOrder-1).*exp(-2*pi*b(c)*tmp_t1).*cos(2*pi*cf(c)*tmp_t1+phase(c));
end

for c = 1:numChan1
    temp11(c,:) = fliplr(temp11(c,:))/midEarCoeff1(c);  
    temp21 = fftfilt(gt(c,:),temp11(c,:));   
    temp11(c,:) = fliplr(temp21(1:sigLength))/midEarCoeff1(c);   
    
    weight1 = zeros(1, sigLength1);      
    for m = 1:numFrame1-increment1/2+1                 
        startpoint1 = (m-1)*winShift1;
        if m <= increment/2                
            weight1(1:startpoint1+winLength1/2) = weight1(1:startpoint1+winLength1/2) + AllOneMask(c,m)*coswin(winLength1/2-startpoint1+1:end);
        else 
            weight1(startpoint1-winLength1/2+1:startpoint1+winLength1/2) = weight1(startpoint1-winLength1/2+1:startpoint1+winLength1/2) + AllOneMask(c,m)*coswin1;
        end
    end
    
    r1 = r1 + temp11(c,:).*weight1;
end

SNR = 10*log10(sum(r1.^2)/sum((r1-r).^2));
SNRout = strcat('Output SNR = ', num2str(SNR) , 'dB');
set(handles.output_snr, 'String', SNRout);
axes(handles.axes1);
plot(r);
xlabel('Time ---->');
ylabel('Amplitude ---->');
title('Denoised Speech'); 
soundsc(r);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
elseif option2 == 1



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[speech,Fs1]=audioread('IEEEFemale.wav');
[noise,Fs]=audioread('speechshapednoise.wav');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
fs = 8000;  
LC = 0;  
SNR = get(handles.slider1,'Value'); 
a = get(handles.popupmenu_nocmc, 'Value');
if a==1
    numChan = 128;
elseif a==2
    numChan = 64;
elseif a==3
    numChan = 32;
end
b = get(handles.popupmenu_nocafb, 'Value');
if b==1
    gLa = 1024;
elseif b==2
    gLa = 512;
elseif b==3
    gLa = 256;
end
c = get(handles.popupmenu_nocsfb, 'Value');
if c==1
    gL = 1024;
elseif c==2
    gL = 512;
elseif c==3
    gL = 256;
end
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

[gs, GMTimpgs] = gammatoneIBMnew(speech, numChan, fRange, fs, gLa); 
[gn, GMTimpgn] = gammatoneIBMnew(scalednoise, numChan, fRange, fs, gLa);
[gns, GMTimpgns] = gammatoneIBMnew(noisyspeech, numChan, fRange, fs, gLa);


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
 SNRout = strcat('Output SNR = ', num2str(SNR) , 'dB');
 set(handles.output_snr, 'String', SNRout);
 axes(handles.axes1);
 plot(rs);
 xlabel('Time ---->');
 ylabel('Amplitude ---->');
 title('Denoised Speech'); 
 soundsc(rs);         
end
end


% --- Executes on selection change in popupmenu_nocafb.
function popupmenu_nocafb_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_nocafb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
end

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_nocafb contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_nocafb


% --- Executes during object creation, after setting all properties.
function popupmenu_nocafb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_nocafb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end

% --- Executes on selection change in popupmenu_nocsfb.
function popupmenu_nocsfb_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu_nocsfb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_nocsfb contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_nocsfb


% --- Executes during object creation, after setting all properties.
function popupmenu_nocsfb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu_nocsfb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

end
% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.radiobutton2, 'Value' ,0);
    set(handles.title, 'String', 'Weintraub Speech Separation System');
end
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton1
% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.radiobutton1, 'Value' ,0);
    set(handles.title, 'String', 'A New Method For Monaural Speech Separation Using IBM');
end
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton2