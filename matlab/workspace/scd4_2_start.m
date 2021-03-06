% ue4 2. dds

clear all;
close all;

% start parameter
NOptimal = 1000;                        % points for "optimal" sine

Bincrement   = 4;                       % Bitwidth of phase increment
IncrementLSB = 2^(-Bincrement+1);
NTable = 2^Bincrement;                  % Number of values reserved for lookup table
fs = 44117;                             % sampling frequency
Periods = 5;                            % Number of periods to simulate
f = 14000;                              % Hz, Frequency of sine generated by 

% generate table
xTable = -1:2/NTable:1-2/NTable;
Table = sin(pi*xTable);

% generate phase increment
Incrementdouble = 2*f/fs;
% quantize phase increment: Hint: Use quant2c with mode: 'r'
Increment = quant2c(Incrementdouble, Bincrement, 'r');

percent = (f * 100 / 13786.5625) - 100

% synthesize signal of length NPoints with phase increment:
x = -1:Increment:2*Periods-1-Increment;
NPoints = length(x);

y = dds(Table, Increment, NPoints, IncrementLSB);

% generate optimal signal
xoptimal = -1:2/NOptimal:2*Periods-1-2/NOptimal;
yoptimal = sin(pi*xoptimal);

xsampled = -1:Increment:2*Periods-1-Increment;
ysampled = sin(pi*xsampled);


% spectrum of generated signal
Y = 1/length(y)*fftshift(fft(y));
w = -.5*fs:1/NPoints*fs:.5*fs-1/NPoints*fs;

%%% plot signal %%%%
figure; plot(x,y,xoptimal,yoptimal, xsampled, ysampled, 'o'); grid
title('Comparison Genernated Signal / Optimal Signal')
xlabel('n')
ylabel('y')

%%% plot spectrum %%%
figure;
subplot(211)
stem(w,abs(Y)); grid
title('Spectrum of generated Signal')
xlabel('\Omega')
ylabel('|Y|)')
axis([-.5*fs, .5*fs, -.1, .6])
subplot(212)
stem(w,angle(Y).*(abs(Y)>1e-6)); grid
title('Spectrum of generated Signal')
xlabel('\Omega')
ylabel('Phase of Y')
axis([-.5*fs, .5*fs, -pi, pi])