function[] = SignalAnalysis(x,fs,nfft)
X = fft(x,nfft);
X = X(1:nfft/2); % FFT is symmetric, throw away second half
mx = abs(X); % Take the magnitude of fft of x
f = (0:nfft/2-1)*fs/nfft; % This is an evenly spaced frequency vector
%f = (0:(fs/nfft):(fs/2)-1); %Both the f will work
% Generate the plot, title and labels.
figure(1);
plot(x);
title('Speech Signal');
xlabel('Time (s)');
ylabel('Amplitude');
figure(2);
grid on
plot(f,mx);
title('Power Spectrum of a Speech Wave');
xlabel('Frequency (Hz)');
ylabel('Power');