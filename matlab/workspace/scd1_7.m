% ############################### scd1_7: Hörtests #################################

clear all
close all

% load audio signal
fprintf('SCD1_7 : Effects of quantization\n')
% filename = input('name of audio file (*.wav): ','s');
[x,fs]=audioread('dsplab_speech.wav');
Ts = 1/fs;
x = x/max(abs(x));   % scaling
x = x*200;
fprintf('original signal) \n')
soundsc(x,fs);
pause(1)
B = input('word length (B=8): ');
if isempty(B)
  B = 8;
end
x = (1-2^(-(B-1)))*x;
L = length(x);
S = sum(x.^2)/L;        % signal power (energy)
xq = quant2c(x,B,'r');  % quantized signal (rounding)
N = sum((xq-x).^2)/L;   % noise power (energy)
SNR = S/N;  
fprintf('quantization SNR = %g dB\n',10*log10(SNR));
FIG1=figure('Name','quantized audio signal','NumberTitle','off');
t=0:Ts:(L-1)*Ts;
plot(t,x,t,xq,'.')
grid, xlabel('t [s] \rightarrow'), ylabel('[x]_Q(t) \rightarrow')
fprintf('quantized signal %g bits \n\n',B)
soundsc(xq,fs);
% end

% a.) das Sprachsignal ist bis zu einer Wortlänge von 4 Bit verständlich.

% b.) bei Extremer Übersteuerung ist die Sprachausgabe auch noch mit 2 Bit
% erkennbar, jedoch ist die Ausgabe lauter.