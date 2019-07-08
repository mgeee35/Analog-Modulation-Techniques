% FREQUENCY MODULATION
% MUSTAFA GÜÇLÜ - 05110000994
% ÝBRAHÝM BATUHAN ÖZTÜRK - 05150000711
% Analog Modulation Techniques
% Ege University EEE Communication Systems Project 
% May 2016 - GNU GPL v3 Licensed

clc;
clear all;
close all;
date = datetime('now') %for homework date details
fs=1000; %Sampling frequency
t=0:1/fs:1; %Time vector
Am=input('Amplitude of Message Signal='); %Amplitude of signal
fm=input('Message frequency='); %Accepting input value
Ac=input('Amplitude of Carrier Signal='); %Amplitude of signal
fc=input('Carrier frequency='); %Accepting input value (fc>fm)
kf=input('Modulation Index='); %Frequency Deviation Sensitivity
Sm=Am*sin(2*pi*fm*t); %Message Signal
subplot(2,1,1); %Plotting frame divided in to 2 rows and this fig appear at 1st
plot(t,Sm);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
grid on;
wc=2*pi*fc;
S=cos(wc*t+(kf*2*pi.*Sm.*t)); %FM Signal
subplot(2,1,2);
plot(t,S);
xlabel('Time');
ylabel('Amplitude');
title('FM in Time Domain');
grid on;

figure;
L=length(S); %Length of FM signal
f=linspace(-fs/2,fs/2,L); %Frequency vector
plot(f,abs(fftshift(fft(S,L)/L)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('FM in Frequency Domain');
grid on;