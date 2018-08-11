% #############  scd1_5.m: Aufnahme von Quantisierungskennlinien eines Sinus #############
% 

clear all
close all

% input signal
t = 0:(pi/100):(2*pi);
sine = sin(t);

% Bit width
B = 4;

% quantization
sine_qr = quant2c(sine,B,'r');  % rounding
sine_qf = quant2c(sine,B,'f');  % truncation

% graphics
figure('Name','Quantization Sinus ','NumberTitle','off');

subplot(2,3,1),plot(t,sine),grid
xlabel('t\rightarrow')
ylabel('sine\rightarrow')
title('base signal')
axis([0,(2*pi),-1.5,1.5])

subplot(2,3,2),plot(t,sine_qr,t,sine_qr,'.'),grid
xlabel('t\rightarrow')
ylabel('sine_{Q,r}\rightarrow')
title('rounding')
axis([0,(2*pi),-1.5,1.5])

subplot(2,3,3),plot(t,sine_qf,t,sine_qf,'.'),grid
xlabel('t\rightarrow')
ylabel('sine_{Q,f}\rightarrow')
title('truncation')
axis([0,(2*pi),-1.5,1.5])

subplot(2,3,5),plot(t,sine_qr-sine),grid
xlabel('t\rightarrow')
ylabel('\Delta_r\rightarrow')
axis([0,(2*pi),-1,1])
axis 'auto y'

subplot(2,3,6),plot(t,sine_qf-sine),grid
xlabel('t\rightarrow')
ylabel('\Delta_f\rightarrow')
axis([0,(2*pi),-1,1])
axis 'auto y'

% end
