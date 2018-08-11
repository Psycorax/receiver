% ue6 dds

close all;
clear all;

load filters_all_240_42.mat;

fs = 44117;
Ts = 1/fs;
N_symb = 157;  % 
T_symb = N_symb * Ts;  % Abtastwerte pro übertragenen Bit
N = 1000; % Anzahl zu sendender Bits
add_noise_freq = true;
f_noise = 1000;
snr = 4;

bit_rate = 281;

% OWN
%fu = 7237.9453125000;   % entspricht binär 0
%fo = 12063.2421875000;   % entspricht binär 1
% ALL
fu = 8788.9335937500;
fo = 13614.2304687500;
%f_noise = fu-7754.9414062500;

% Precision of DDS:
DDSPrecison = 0.05;

% Erzeugung zweier freilaufender Oszillatorschwingungen
t = 0:Ts:N*T_symb-Ts;
NPoints = length(t);
oszillator_1 = cos(2*pi*fu*t)+rand(1,NPoints)*DDSPrecison-DDSPrecison/2;
oszillator_2 = cos(2*pi*fo*t)+rand(1,NPoints)*DDSPrecison-DDSPrecison/2;
noise_1 = cos(2*pi*(fo+f_noise)*t)+rand(1,NPoints)*DDSPrecison-DDSPrecison/2;
noise_2 = cos(2*pi*(fu-f_noise)*t)+rand(1,NPoints)*DDSPrecison-DDSPrecison/2;

% ****************** sender ***********************
% Erzeugung einer Anzahl (N) zufälliger Datenbits
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

% ******************* channel ********************
Psignal = 1/length(s)*sum(s.^2);
noise = 2*randn(1,length(s))-1;
Pnoise = 1/length(noise)*sum(noise.^2);
NoiseScale = sqrt(Psignal/10^(snr/10)/Pnoise);
noise = noise * NoiseScale;
r = s + noise; %r is the signal through the AWGN channel
if (eq(add_noise_freq, true))
    r = r + 0.3*noise_1 + 0.3*noise_2;
end

X = fftshift(fft(r));
M=size(t,2);
dF = fs/M;
f = -fs/2:dF:fs/2-dF;
plot(f,(abs(X)/M));
title('Frequency Spectrum');
xlabel('Hz');
ylabel('Amplitude');

figure;
subplot(2,1,1);
plot(t, s, t, datasignal*2-1);
grid
title('Clean Signal')
axis([0, max(t), -2, 2])

subplot(2,1,2);
plot(t, r, t, datasignal*2-1);
grid
title('Signal + Noise')
xlabel('t')
axis([0, max(t), -2, 2])

L_BP_u = norm(BP_u, 'l1');
L_BP_o = norm(BP_o, 'l1');
L_TP = norm(TP, 'l1');

BP_U_s = (1/L_BP_u)*BP_u.Numerator;
BP_O_s = (1/L_BP_o)*BP_o.Numerator;
TP_s = (1/L_TP)*TP.Numerator;

% filter signals
r_BP_u = filter((1/L_BP_u)*BP_u.Numerator, 1, r);   % Bandpass for low freq
r_BP_o = filter((1/L_BP_o)*BP_o.Numerator, 1, r);   % Bandpass for high freq
r_diff = abs(r_BP_o) - abs(r_BP_u); % calc difference of absolut value of the 2 filtered signals
r_diff_TP = filter((1/L_TP)*TP.Numerator, 1, r_diff)+0.5; % filter difference with lowpass


% Calculate Filter Delay and delay datasignal with the same value
filt_delay = round(((size(BP_o.Numerator,2)-1)/2 + (size(TP.Numerator,2)-1)/2));
datasignal = [zeros(1,filt_delay), datasignal(1:size(datasignal,2)-filt_delay)];


sample = (1:N);
sample_steps = N_symb*t(2);
bit_error = 0;
for n = filt_delay+round(N_symb/2):N_symb:N*N_symb 
    sample(round((n-filt_delay)/N_symb)) = r_diff_TP(n);
    tmp = round(r_diff_TP(n));
    if (ne(tmp, datasignal(n)))
        bit_error = bit_error + 1;
    end
end


figure;
subplot(3,1,1);
plot(t, r_BP_u);
title('Signal filtered through BP_{low}');
axis([0, max(t), -1.5, 1.5])
subplot(3,1,2);
plot(t, r_BP_o);
title('Signal filtered through BP_{high}');
axis([0, max(t), -1.5, 1.5])
subplot(3,1,3);
plot(t, r_diff_TP, t, datasignal); %, (t(2)*filt_delay+sample_steps/2:sample_steps:max(t)), sample, 'xk');
str = ['Signal after Lowpass vs. Digital Signal', char(10) ,'Bit Error: ',num2str(bit_error)];
title(str);
axis([0, max(t), -0.5, 1.5])

audiowrite('test.wav', s*0.9, fs);