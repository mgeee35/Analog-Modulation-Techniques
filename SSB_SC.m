% SINGLE SIDE BAND SUPPRESSED CARRIER MODULATION
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
Sm=Am*sin(2*pi*fm*t); %Message Signal
Sm_H=Am*sin(2*pi*fm*t-pi/2); %Hilbert Transform of Message Signal
figure(1);
subplot(3,1,1); %Plotting frame divided in to 3 rows and this fig appear at 1st
plot(t,Sm);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
grid on;
Sc=Ac*cos(2*pi*fc*t); %Carrier Signal
subplot(3,1,2);
plot(t,Sc);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');
grid on;
USB=2.*Sm.*Sc+2.*Sm_H.*Sc; %USB-SSB-SC Signal
LSB=2.*Sm.*Sc-2.*Sm_H.*Sc; %LSB-SSB-SC Signal
subplot(3,1,3);
plot(t,LSB);
xlabel('Time');
ylabel('Amplitude');
title('LSB-SSB-SC in Time Domain');
grid on;

figure(2);
L=length(LSB); %Length of AM signal
f=linspace(-fs/2,fs/2,L); %Frequency vector
plot(f,abs(fftshift(fft(LSB,L)/L)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('LSB-SSB-SC in Frequency Domain');
grid on;