% SCD5 - Matlab - Übung 4 - Teil II
% RX - Gruppe

%clear all;
close all;

% frequencys and times
fs = 44117;
fu = 7238;
fo = 12063;

% channel snr in dB
snr = 100;

% number of bits
N = 8;
N_symb = 157;

% times
Ts = 1 / fs;
T_symb = Ts * N_symb;

% Calculate total system delay in samples
grpdelay_bp = grpdelay(bp_fo_16,1);
grpdelay_tp = grpdelay(tp_16,1);
delay = ceil(grpdelay_bp(1) + grpdelay_tp(1));

% Precision of DDS:
DDSPrecison = 0.05;

% Erzeugung zweier freilaufender Oszillatorschwingungen
t = 0:Ts:N*T_symb+(delay*Ts)-Ts;
NPoints = length(t);
oszillator_1 = cos(2*pi*fu*t)+rand(1,NPoints)*DDSPrecison-DDSPrecison/2;
oszillator_2 = cos(2*pi*fo*t)+rand(1,NPoints)*DDSPrecison-DDSPrecison/2;

% ****************** sender ***********************
% Erzeugung einer Anzahl (N) zufaelliger Datenbits
data_transmit = round(rand(1,N));

% Erzeugung des Sendesignals
s = [];
datasignal = [];

for k = 1:N
    if data_transmit(k) == 0
        s = [s, oszillator_1((k-1)*N_symb+1:k*N_symb)];
        datasignal = [datasignal zeros(1,N_symb)];
    else
        s = [s, oszillator_2((k-1)*N_symb+1:k*N_symb)];
        datasignal = [datasignal ones(1,N_symb)];
    end
end

% zero padding on sending signal
s = [s, zeros(1, delay)];
datasignal = [datasignal zeros(1, delay)];

% ******************* channel ********************
Psignal = 1/length(s)*sum(s.^2);
noise = 2*randn(1,length(s))-1;
Pnoise = 1/length(noise)*sum(noise.^2);
NoiseScale = sqrt(Psignal/10^(snr/10)/Pnoise);
noise = noise * NoiseScale;
r = s + noise; % r is the signal through the AWGN channel

% spectrum of transmission and reception signal
S = 1/length(s)*fftshift(fft(s));
R = 1/length(r)*fftshift(fft(r));
NPoints = length(t);
w = -.5*fs:1/NPoints*fs:.5*fs-1/NPoints*fs;

% bandpass-filter the reception signal with bp_fo and bp_fu
r_u = filter(bp_fu_16,1,r);
r_o = filter(bp_fo_16,1,r);

% spectrum of the bp-filtered reception signals
R_u = 1/length(r_u)*fftshift(fft(r_u));
R_o = 1/length(r_o)*fftshift(fft(r_o));

% get the absolute value of the signals
r_u_abs = abs(r_u);
r_o_abs = abs(r_o);

% spectrum of the absolute value rec. signals
R_u_abs = 1/length(r_u_abs)*fftshift(fft(r_u_abs));
R_o_abs = 1/length(r_o_abs)*fftshift(fft(r_o_abs));

% subtract the signals
r_out = r_o_abs - r_u_abs;

% lowpass-filter the output signal
r_out_tp = filter(tp_16,1,r_out);

% spectrum of the absolute value rec. signals
R_out = 1/length(r_out)*fftshift(fft(r_out));
R_out_tp = 1/length(r_out_tp)*fftshift(fft(r_out_tp));


%% *********************** plotting ***********************

% plot the generated signals
figure;
subplot(211)
plot(t, oszillator_1); grid
title(['Transmission signal with f_u = ' num2str(fu) ' Hz'])
xlabel('t[s]')
ylabel('y')
axis([0, 1.5e-3, -1.5, 1.5])

subplot(212)
plot(t, oszillator_2); grid
title(['Transmission signal with f_o = ' num2str(fo) ' Hz'])
xlabel('t[s]')
ylabel('y')
axis([0, 1.5e-3, -1.5, 1.5])

% plot the data signals
figure;
subplot(3,1,1)
plot(t, datasignal); grid
title('Datasignal')
xlabel('t[sec]')
ylabel('datasignal(t)')
axis([0, max(t), -0.5, 1.5])

subplot(3,1,2)
plot(t, s); grid
title('Transmission signal')
xlabel('t[sec]')
ylabel('s(t)')
axis([0, max(t), -1.5, 1.5])

subplot(3,1,3)
plot(t, r); grid
title(['Reception signal after AWGN channel with SNR = ' num2str(snr) 'dB'])
xlabel('t[sec]')
ylabel('r(t)')
axis([0, max(t), -1.5, 1.5])

% plot spectrum of the data signals
figure;
subplot(2,1,1)
plot(w,abs(S)); grid;
title('Spectrum of Transmission signal')
xlabel('f')
ylabel('|S|')
axis([-.5*fs, .5*fs, -.1, .3])

subplot(2,1,2)
plot(w,abs(R)); grid;
title('Spectrum of Reception signal')
xlabel('f')
ylabel('|R|')
axis([-.5*fs, .5*fs, -.1, .3])

% plot the filtered reception signals
figure;
subplot(3,2,1)
plot(t, r); grid
title(['Reception signal after AWGN channel with SNR = ' num2str(snr) 'dB'])
xlabel('t[sec]')
ylabel('r(t)')
axis([0, max(t), -1.5, 1.5])

subplot(3,2,3)
plot(t, r_u); grid
title(['Reception signal after bandpass for f_u = ' num2str(fu) ' Hz'])
xlabel('t[sec]')
ylabel('r_u(t)')
axis([0, max(t), -1.5, 1.5])

subplot(3,2,5)
plot(t, r_o); grid
title(['Reception signal after bandpass for f_o = ' num2str(fo) ' Hz'])
xlabel('t[sec]')
ylabel('r_o(t)')
axis([0, max(t), -1.5, 1.5])

% plot spectrum of the filtered reception signals
subplot(3,2,2)
plot(w,abs(R)); grid;
title('Spectrum of Reception signal')
xlabel('f')
ylabel('|R|')
axis([-.5*fs, .5*fs, -.1, .3])

subplot(3,2,4)
plot(w,abs(R_u)); grid;
title('Spectrum of Reception signal after bandpass with f_u')
xlabel('f')
ylabel('|R_u|')
axis([-.5*fs, .5*fs, -.1, .3])

subplot(3,2,6)
plot(w,abs(R_o)); grid;
title('Spectrum of Reception signal after bandpass with f_o')
xlabel('f')
ylabel('|R_o|')
axis([-.5*fs, .5*fs, -.1, .3])

% plot the filtered absolute reception signals
figure;
subplot(2,2,1)
plot(t, r_u_abs); grid
title('abs. rec. sig. f_u')
xlabel('t[sec]')
ylabel('|r_u(t)|')
axis([0, max(t), -0.5, 1.5])

subplot(2,2,3)
plot(t, r_o_abs); grid
title('abs. rec. sig. f_o')
xlabel('t[sec]')
ylabel('|r_o(t)|')
axis([0, max(t), -0.5, 1.5])

% plot spectrum of the filtered absolute reception signals
subplot(2,2,2)
plot(w,abs(R_u_abs)); grid;
title('spectr. abs. rec. sig. f_u')
xlabel('f')
ylabel('|R_u_abs|')
axis([-.5*fs, .5*fs, -.1, .3])

subplot(2,2,4)
plot(w,abs(R_o_abs)); grid;
title('spectr. abs. rec. sig. f_o')
xlabel('f')
ylabel('|R_o_abs|')
axis([-.5*fs, .5*fs, -.1, .3])

% plot signal
figure;
subplot(2,2,1)
plot(t, r_out); grid
title('r_{out}')
xlabel('t[sec]')
ylabel('|r_{out}(t)|')
axis([0, max(t), -1.5, 1.5])

subplot(2,2,3)
plot(t, r_out_tp); grid
title('r_{out\_tp}')
xlabel('t[sec]')
ylabel('|r_{out\_tp}(t)|')
axis([0, max(t), -1.5, 1.5])

% plot spectrum 
subplot(2,2,2)
plot(w,abs(R_out)); grid;
%title('spectr. abs. rec. sig. f_u')
xlabel('f')
ylabel('|R_{out}|')
axis([-.5*fs, .5*fs, -.1, .3])

subplot(2,2,4)
plot(w,abs(R_out_tp)); grid;
%title('spectr. abs. rec. sig. f_o')
xlabel('f')
ylabel('|R_{out\_tp}|')
axis([-.5*fs, .5*fs, -.1, .3])

% plot signal
t_temp = t(1:end-delay);
y1_temp = r_out_tp(delay+1:end);
y2_temp = datasignal(1:end-delay);
figure;
plot(t_temp, y1_temp, t_temp, y2_temp); grid
axis([0, max(t_temp), -1.5, 1.5])

% generate .wav file for tests
audiowrite('testfile1.wav', r, fs);