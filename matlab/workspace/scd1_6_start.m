% ##################### scd1_6: SNR Messungen #######################

% measurement of signal-to-quantization noise power ratio

clear all
close all

% vector of wordlengths to be investigated
B = [2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];

% linear input signal
x = -1:0.001:1;                         % input signal
S = sum(x.^2)/length(x);                % signal power
SNR_l = zeros(size(B));
for k=1:length(B)
  xq = quant2c(x,B(k),'r');                % quantized signal (rounding)
  N = sum((xq-x).^2)/length(x);         % noise power
  SNR_l(k) = S/N;                       % SNR  
end


SNR_l_dB = 10*log10(SNR_l);
SNR_l_dB_Schaetzung = zeros(size(B));

for k=1:length(B)
    SNR_l_dB_Schaetzung(k) = B(k)*6;
end

SNR_Abweichung = SNR_l_dB - SNR_l_dB_Schaetzung;


% sinusoidal input signal
n = 0:0.001:1;                          % normalized time
x = sin(2*pi*n);                        % input signal
S = sum(x.^2)/length(x);                % signal power
SNR_s = zeros(size(B));
for k=1:length(B)
  xq   = quant2c(x,k,'r');              % quantized signal (rounding)
  N = sum((xq-x).^2)/length(x);         % noise power
  SNR_s(k) = S/N;                       % SNR
end

% speech signal
[x,fs]=audioread('dsplab_speech.wav');
x = x/max(abs(x));                      % scaling
S = sum(x.^2)/length(x);                % signal power
SNR_speech = zeros(size(B));
for k=1:length(B)-1
  xq = quant2c(x,k,'r');                % quantized signal (rounding)
  N = sum((xq-x).^2)/length(x);         % noise power
  SNR_speech(k) = S/N;                  % SNR
end

% graphics
figure('Name','quantization SNR','NumberTitle','off');
subplot(2,1,1), plot(B,10*log10(SNR_l),'o',B,10*log10(SNR_s),'*',...
  B,10*log10(SNR_speech),'+')
h = legend('linear','sinusiodal','speech');
xlabel('word length B [bits] \rightarrow')
ylabel('SNR [dB] \rightarrow')
hold on
plot(B,10*log10(SNR_l),':',B,10*log10(SNR_s),':',...
  B,10*log10(SNR_speech),':'),grid
hold off
subplot(2,1,2), plot(B,SNR_Abweichung), grid
xlabel('word length B [bits] \rightarrow')
ylabel('\Delta_{SNR} [dB] \rightarrow')
% end

% linear input signal
x = -1:0.001:1;                         % input signal
x = x/2;
S = sum(x.^2)/length(x);                % signal power
SNR_l = zeros(size(B));
for k=1:length(B)
  xq = quant2c(x,k,'r');                % quantized signal (rounding)
  N = sum((xq-x).^2)/length(x);         % noise power
  SNR_l(k) = S/N;                       % SNR  
end

% sinusoidal input signal
n = 0:0.001:1;                          % normalized time
x = sin(2*pi*n);                        % input signal
x = x/2;
S = sum(x.^2)/length(x);                % signal power
SNR_s = zeros(size(B));
for k=1:length(B)
  xq   = quant2c(x,k,'r');              % quantized signal (rounding)
  N = sum((xq-x).^2)/length(x);         % noise power
  SNR_s(k) = S/N;                       % SNR
end

% speech signal
[x,fs]=audioread('dsplab_speech.wav');
x = x/max(abs(x));                      % scaling
x = x/2;
S = sum(x.^2)/length(x);                % signal power
SNR_speech = zeros(size(B));
for k=1:length(B)-1
  xq = quant2c(x,k,'r');                % quantized signal (rounding)
  N = sum((xq-x).^2)/length(x);         % noise power
  SNR_speech(k) = S/N;                  % SNR
end

% graphics
figure('Name','quantization SNR','NumberTitle','off');
plot(B,10*log10(SNR_l),'o',B,10*log10(SNR_s),'*',...
  B,10*log10(SNR_speech),'+')
h = legend('linear','sinusiodal','speech');
xlabel('word length B [bits] \rightarrow')
ylabel('SNR [dB] \rightarrow')
hold on
plot(B,10*log10(SNR_l),':',B,10*log10(SNR_s),':',...
  B,10*log10(SNR_speech),':'),grid
hold off
% end

% linear input signal
x = -1:0.001:1;                         % input signal
x = x/2;
S = sum(x.^2)/length(x);                % signal power
SNR_l = zeros(size(B));
for k=1:length(B)
  xq = quant2c(x,k,'r');                % quantized signal (rounding)
  N = sum((xq-x).^2)/length(x);         % noise power
  SNR_l(k) = S/N;                       % SNR  
end

% sinusoidal input signal
n = 0:0.001:1;                          % normalized time
x = sin(2*pi*n);                        % input signal
x = x*1.02;
S = sum(x.^2)/length(x);                % signal power
SNR_s = zeros(size(B));
for k=1:length(B)
  xq   = quant2c(x,k,'r');              % quantized signal (rounding)
  N = sum((xq-x).^2)/length(x);         % noise power
  SNR_s(k) = S/N;                       % SNR
end

% speech signal
[x,fs]=audioread('dsplab_speech.wav');
x = x/max(abs(x));                      % scaling
x = x*1.02;
S = sum(x.^2)/length(x);                % signal power
SNR_speech = zeros(size(B));
for k=1:length(B)-1
  xq = quant2c(x,k,'r');                % quantized signal (rounding)
  N = sum((xq-x).^2)/length(x);         % noise power
  SNR_speech(k) = S/N;                  % SNR
end

% graphics
figure('Name','quantization SNR','NumberTitle','off');
plot(B,10*log10(SNR_l),'o',B,10*log10(SNR_s),'*',...
  B,10*log10(SNR_speech),'+')
h = legend('linear','sinusiodal','speech');
xlabel('word length B [bits] \rightarrow')
ylabel('SNR [dB] \rightarrow')
hold on
plot(B,10*log10(SNR_l),':',B,10*log10(SNR_s),':',...
  B,10*log10(SNR_speech),':'),grid
hold off
% end

% a.) Bis 6 Bit stimmt die Abschätzung nicht, danach trifft sie zu.
%     Allerdings ist ein Offset von 6dB vorhanden.

% b.) Das SNR ist beim sinusförmigen Signal um ca 2dB besser als beim
% linearen Signal

% c.) das SNR ist beim Sprachsignal um ca. 10dB schlechter als beim
% linearen Signal

% d.) das SNR sinkt bei ab einer Wortlänge von 4Bits um ca. 7dB.

% e.) beim Sinussignal ist ab einer Wortlänge von ca. 8Bits eine Krümmung 
% des Grafen zu sehen. Beim Sprachsignal ist ab einer Wortlänge von ca.
% 13Bits eine Krümmung des Grafen zu sehen.

