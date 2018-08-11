% ############################ scd3_1: Fixed point arithmetik ############################
% estimation of round-off in 2nd order block with quantized
% coefficients and fixed-point arithmetic and scaling

clear all
close all

S1  = 'r';
S2  = 's';
WL  = 14;
N   = 10000;
a   = [1,0,0.9025];
xi  = [0 0];

% Constants for fixed-point arithmetic
LSB  = 2^(-WL+1); % least significant bit (LSB)

% Quantized input signal
x = 2*rand(1,N)-ones(1,N);
xq = LSB*round(x/LSB); 

counter = 1;

% dummy values
max_factor = 100;
snr_vec(1) = 1.0;

for i = 0:0.001:1

    % scale factors
    b   = [1 0 0];
    b = i*b;

    % Quantized coefficients
    bq = LSB*round(b/LSB);
    for k=1:3
       if bq(k)==1
          bq(k) = 1-LSB;
       end % if
    end % for
    aq(1) = 1; 
    aq(2) = LSB*round((a(2)/2)/LSB); 
    aq(3) = LSB*round(a(3)/LSB); 

    % Referenz system : 2nd order block with matlab default arithmetic
    [yref,zref] = filter(bq,[aq(1) 2*aq(2) aq(3)],xq,xi);

    % 2nd order block with fixed-point arithmetic
    mode = [S1 S2];
    [y,xio,OC,OC_y] = filt2_qa(bq,aq,xq,xi,LSB,mode);

    % Measurement of round-off noise and SNR
    % Error signal
    e = yref - y; 
    % Power measurement
    Px = sum(xq.^2)/N;              % power of input signal
    PxdB = 10*log10(Px);
    Py = sum(y.^2)/N;               % power of output (noisy) signal 
    PydB = 10*log10(Py);
    Pyref = sum(yref.^2)/N;       % power of output (clean) signal 
    PyrefdB = 10*log10(Pyref);
    Pe = sum(e.^2)/N;               % power of error signal
    PedB = 10*log10(Pe);

    SNR = PyrefdB - PedB;          % Signal to noise ration

    if SNR > max(snr_vec)
        max_factor = i;
    end
    
    snr_vec(counter) = SNR;
    counter = counter + 1;
    
end

snr_max = max(snr_vec);

% Display results
fprintf('SNR for %f: %g dB\n',max_factor,snr_max)
% end