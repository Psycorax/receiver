function frealizable( B, fs )
%FREALIZABLE Summary of this function goes here
%   Detailed explanation goes here

% Prints the realizable frequencies by DDS
%
% frealizable( B, fs )
%   B  : Bitwidth of the phase increment
%   fs : Sampling frequency of the phase accumulator

fprintf('Ermitteln der realisierbaren Frequenzen');
fprintf(' bei %d Bit mit fs = %d Hz:\n', B, fs);
fprintf('Phaseninkrement:\tFrequenz:\n');

% Calculate the LSB of the given Bitwidth
LSB = 2^(-B+1);

% Loop all phase increments from 0+LSB to 1-LSB
for delta_x = LSB:LSB:1-LSB
    % Calculate the frequency with the current phase inc.
    f = fs * delta_x / 2;
    fprintf('%f\t\t\t%f\n', delta_x, f);
end

end

