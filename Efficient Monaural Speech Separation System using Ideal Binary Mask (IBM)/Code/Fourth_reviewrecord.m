function varargout = Fourth_reviewrecord(varargin)
%FOURTH_REVIEWRECORD MATLAB code file for Fourth_reviewrecord.fig
%      FOURTH_REVIEWRECORD, by itself, creates a new FOURTH_REVIEWRECORD or raises the existing
%      singleton*.
%
%      H = FOURTH_REVIEWRECORD returns the handle to a new FOURTH_REVIEWRECORD or the handle to
%      the existing singleton*.
%
%      FOURTH_REVIEWRECORD('Property','Value',...) creates a new FOURTH_REVIEWRECORD using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Fourth_reviewrecord_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      FOURTH_REVIEWRECORD('CALLBACK') and FOURTH_REVIEWRECORD('CALLBACK',hObject,...) call the
%      local function named CALLBACK in FOURTH_REVIEWRECORD.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Fourth_reviewrecord

% Last Modified by GUIDE v2.5 04-Mar-2018 10:10:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Fourth_reviewrecord_OpeningFcn, ...
                   'gui_OutputFcn',  @Fourth_reviewrecord_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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

% --- Executes just before Fourth_reviewrecord is made visible.
function Fourth_reviewrecord_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Fourth_reviewrecord
handles.output = hObject;

handles.Fs = 8000;
handles.recorder = audiorecorder(handles.Fs,8,1);
axes(handles.axes2);
imshow('images.png');
axes(handles.axes3);
imshow('images.png');
axes(handles.axes4);
imshow('images.png');
axes(handles.axes5);
imshow('images.png');

% Update handles structure
guidata(hObject, handles);
end
% UIWAIT makes Fourth_reviewrecord wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Fourth_reviewrecord_OutputFcn(hObject, eventdata, handles)
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
end
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu_nocmc contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu_nocmc


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

% --- Executes on button press in pushbutton_ns.
function pushbutton_ns_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
  
[speech]=audioread('test.wav');
[noise]=audioread('speechshapednoise.wav');
SNR = get(handles.slider1,'Value');
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


% --- Executes on button press in pushbutton_dns.
function pushbutton_dns_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_dns (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

option1 = get(handles.radiobutton1, 'Value');
option2 = get(handles.radiobutton2, 'Value');
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

[speech]=audioread('test.wav');
[noise]=audioread('speechshapednoise.wav');
fs = 8000;
LC = 0; 
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
gs = gammatoneIBMnew(speech, numChan, fRange, fs, gLn);
gn = gammatoneIBMnew(scalednoise, numChan, fRange, fs, gLn);
gns = gammatoneIBMnew(noisyspeech, numChan, fRange, fs, gLn);
temp11 = gs;

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
r1 = zeros(1,sigLength);
for i = 1:winLength 
    coswin(i) = (1 + cos(2*pi*(i-1)/winLength - pi))/2;
end

phase(1:numChan) = zeros(numChan,1);       
erb_b = hz2erb(fRange);       
erb = [erb_b(1):diff(erb_b)/(numChan-1):erb_b(2)];    
cf = erb2hz(erb);       
b = 1.019*24.7*(4.37*cf/1000+1);     

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

AllOneMask=zeros(numChan, numFrame);
AllOneMask(:,:)=1;





if option1 == 1
    for c = 1:numChan
        temp1(c,:) = gns(c,:);
        temp1(c,:) = fliplr(temp1(c,:))/midEarCoeff(c);    
        temp2 = fftfilt(gt(c,:),temp1(c,:));   
        temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);    
        weight = zeros(1, sigLength);
        for m = 1:numFrame-increment/2+1                
            startpoint = (m-1)*winShift;
            if m <= increment/2               
                weight(1:startpoint+winLength/2) = weight(1:startpoint+winLength/2) + mask(c,m)*coswin(winLength/2-startpoint+1:end);
            else
                weight(startpoint-winLength/2+1:startpoint+winLength/2) = weight(startpoint-winLength/2+1:startpoint+winLength/2) + mask(c,m)*coswin;
            end
        end
        r = r + temp1(c,:).*weight;
    end
    for c = 1:numChan
        temp11(c,:) = fliplr(temp11(c,:))/midEarCoeff(c); 
        temp21 = fftfilt(gt(c,:),temp11(c,:));   
        temp11(c,:) = fliplr(temp21(1:sigLength))/midEarCoeff(c);   
        weight = zeros(1, sigLength);      
        for m = 1:numFrame-increment/2+1                 
            startpoint = (m-1)*winShift;
            if m <= increment/2                
                weight(1:startpoint+winLength/2) = weight(1:startpoint+winLength/2) + AllOneMask(c,m)*coswin(winLength/2-startpoint+1:end);
            else
                weight(startpoint-winLength/2+1:startpoint+winLength/2) = weight(startpoint-winLength/2+1:startpoint+winLength/2) + AllOneMask(c,m)*coswin;
            end
        end
 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        
        r1 = r1 + temp11(c,:).*weight;
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
else if option2 == 1
        for c = 1:numChan
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
            temp2 = fftfilt(gt(c,:),temp1(c,:));   
            temp1(c,:) = fliplr(temp2(1:sigLength))/midEarCoeff(c);    
            r = r + temp1(c,:);
        end
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        for c = 1:numChan
            weight = zeros(1, sigLength);      
            for m = 1:numFrame-increment/2+1              
                startpoint = (m-1)*winShift;
                if m <= increment/2                
                    weight(1:startpoint+winLength/2) = weight(1:startpoint+winLength/2) + AllOneMask(c,m)*coswin(winLength/2-startpoint+1:end);
                else
                    weight(startpoint-winLength/2+1:startpoint+winLength/2) = weight(startpoint-winLength/2+1:startpoint+winLength/2) + AllOneMask(c,m)*coswin;
                end
            end
            temp11(c,:) = gs(c,:).*weight;
            temp11(c,:) = fliplr(temp11(c,:))/midEarCoeff(c);    
            temp21 = fftfilt(gt(c,:),temp11(c,:));  
            temp11(c,:) = fliplr(temp21(1:sigLength))/midEarCoeff(c);  
            r1 = r1 + temp11(c,:);
        end
    end
end
    SNR = 10*log10(sum(r1.^2)/sum((r1-r).^2));
    SNRout = strcat('Output SNR = ', num2str(SNR) , 'dB');
    set(handles.output_snr, 'String', SNRout);
    
    stoi_val = stoi(speech,r,8000);
    STOI = strcat('STOI = ', num2str(stoi_val));
    set(handles.stoi, 'String', STOI);
    
    axes(handles.axes1);
    plot(r);
    xlabel('Time ---->');
    ylabel('Amplitude ---->');
    title('Denoised Speech'); 
    soundsc(r);
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

% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if (get(hObject,'Value') == get(hObject,'Max'))
    set(handles.radiobutton2, 'Value' ,0);
    set(handles.title, 'String', 'Typical Monaural Speech Separation System');
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
    set(handles.title, 'String', 'Proposed Monaural Speech Separation System');
end
end
% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in record.
function record_Callback(hObject, eventdata, handles)
% hObject    handle to record (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
record(handles.recorder);
end

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.recorder);
global myRecording
myRecording = getaudiodata(handles.recorder);
axes(handles.axes1);
plot(myRecording);
xlabel('Time ---->');
ylabel('Amplitude ---->');
title('Speech'); 
audiowrite('test.wav',myRecording,8000);

end
