% #############  scd1_4.m: Aufnahme von Quantisierungskennlinien #############
% 

clear all
close all

% input signal
% interval from -1.5 to +1.5 in 0.02 steps
% range to exceeds -1 and +1 to demonstrate the saturation area
x = -1.5:0.02:1.5;

% Bit width
B = 3;

% quantization
xqr = quant2c(x,B,'r');  % rounding
xqf = quant2c(x,B,'f');  % truncation

% graphics
figure('Name','quantization ','NumberTitle','off');
subplot(2,2,1),plot(x,xqr,x,xqr,'.'),grid
xlabel('x \rightarrow')
ylabel('[x]_{Q,r}   \rightarrow')
title('rounding')
axis([-1.5,1.5,-1.2,1.2])
subplot(2,2,3),plot(x,xqr-x),grid
xlabel('x  \rightarrow')
ylabel('\Delta_r  \rightarrow')
subplot(2,2,2),plot(x,xqf,x,xqf,'.'),grid
xlabel('x  \rightarrow')
ylabel('[x]_{Q,f}   \rightarrow')
title('truncation')
axis([-1.5,1.5,-1.2,1.2])
subplot(2,2,4),plot(x,xqf-x),grid
xlabel('x  \rightarrow')
ylabel('\Delta_f  \rightarrow')
% end
