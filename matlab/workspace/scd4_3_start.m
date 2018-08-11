% ue4 dds

clear all;
close all;

% start parameter
NOptimal = 1000;                         % points for "optimal" sine

Bincrement   = 4;                        % Bitwidth of phase increment
IncrementLSB =  2^(-Bincrement+1);
NTable = 8;                              % Number of values reserved for lookup table
fs = 44117;                              % sampling frequency
Periods = 5;                           % Number of periods to simulate
f = 2757;                                % Hz

% generate table
xTable = -1:2/NTable:1-2/NTable;
Table = sin(pi*xTable);

% generate phase increment
Incrementdouble = 2*f/fs;
Increment = quant2c(Incrementdouble, Bincrement, 'r');

% calculate the actual generated frequency
ActualFreq = Increment*fs/2

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
figure; plot(x,y,xoptimal,yoptimal, xsampled, ysampled); grid
title('Comparison generated Signal / Optimal Signal')
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
xlabel('f [Hz]')
ylabel('Phase of Y')
axis([-.5*fs, .5*fs, -pi, pi])

OmegaP = 3000;
OmegaS = 6000;
DeltaP = Increment/4;
DeltaS = Increment/4;

% Filter design (Remez algorithm)
dev = [DeltaP DeltaS];
f = [OmegaP OmegaS];
m = [1 0];
[n,f0,m0,w] = remezord(f,m,dev,fs);
n = n + 2;              % compensate for estimation error
h =  remez(n,f0,m0,w);  % impulse response

% filter
yf = filter(h,1,y);

delay = 28;

% exactly one period of filterd signal for comparison to optimal signal
yf_one_period = -yf(delay:((length(yf)/Periods)+delay));
x_one_period = 0:2/(length(yf_one_period)-1):2;

yopt_one_period = sin(pi*x_one_period);
%%% plot signal %%%%
figure; 
subplot(211)
plot(x_one_period,yf_one_period,x_one_period,yopt_one_period); grid
title('Comparison filtered Signal / Optimal Signal')
xlabel('t')
ylabel('y')
subplot(212)
plot(x_one_period,yopt_one_period-yf_one_period); grid
title('Error between optimal and synthesized signal')
xlabel('t')
ylabel('y_{optimal}-y_{synthesized}')

Fehler = max(abs(yopt_one_period-yf_one_period))*100

Yf = 1/length(yf)*fftshift(fft(yf));
w = -.5*fs:1/length(Yf)*fs:.5*fs-1/length(Yf)*fs;

%%% plot spectrum %%%
figure;
stem(w,abs(Yf)); grid
title('Spectrum of filtered Signal')
xlabel('f [Hz]')
ylabel('|Y|)')
axis([-.5*fs, .5*fs, -.1, .6])
