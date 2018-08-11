% ############################ scd3_1: Fixed point arithmetik ############################
% estimation of round-off in 2nd order block with quantized
% coefficients and fixed-point arithmetic and scaling

clear all
close all

% Input of simulation parameters
fprintf('\n')
fprintf('scd3_1 : round-off noise * February 2001 * mw \n')
fprintf('\n')
S1  = input('round or truncate to zero ..................... (r)/t ? ','s');
S2  = input('two´s complement or saturation ................ (c)/s ? ','s');
WL  = input('word length in bits............................. (16) ? ');
N   = input('number of simulation cycles ................. (10000) ? ');
b   = input('numerator b ............................... ([1 0 0]) ? ');
a   = input('denominator a ..................... ([1,-1.9,0.9025]) ? ');
xi  = input('initial values for state space variables..... ([0 0]) ? ');
scal= input('b-coefficients scaling factor..... (0=none)/1/2/3=inf/4...own definition of scaling factor ? ');
% Default values
if isempty(S1)
  S1 = 'r';
end
if isempty(S2)
  S2 = 'c';
end
if isempty(WL)
  WL = 16;
end
if isempty(N)
  N = 10000;
end
if isempty(b)
  b = [1 0 0];
end
if isempty(a)
  a = [1,-1.9,0.9025];
end
if isempty(xi)
  xi = [0 0];
end
if isempty(scal)
  scal = 0;
end

% Constants for fixed-point arithmetic
LSB  = 2^(-WL+1); % least significant bit (LSB)

% Poles
poles = roots(a)

% Scaling of b-coefficients
h = impz(b,a);
H = freqz(b,a,4096);
l_1 = norm(h,1);
l_2 = norm(h,2);
l_inf = norm(H,inf);
s1 = 1/l_1;
s2 = 1/l_2;
s_inf = 1/l_inf;
switch scal
case 0
    b = b;
case 1
    b = s1*b;
case 2
    b = s2*b;
case 3
    b = s_inf*b;
case 4
    s= input('scaling factor s =  ? ');
    b = s*b
otherwise
    error('wrong choice of scal')
end

fprintf('Norms: \n')
fprintf(' l1      = %8.7f \n',l_1);
fprintf(' l2      = %8.7f \n',l_2);
fprintf(' l_{inf} = %8.7f \n',l_inf);
fprintf('\n')

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

% Output of original and quantized coefficients
fprintf('word length           : %g\n',WL)
fprintf('least significant bit : %g\n',LSB)
fprintf('filter coefficients   : original and quantized\n')
fprintf(' a0   =  %g\n',a(1));
fprintf(' a1/2 = %8.7f , %8.7f\n',a(2)/2,aq(2));
fprintf(' a2   = %8.7f , %8.7f\n',a(3),aq(3));
fprintf(' b0   = %8.7f , %8.7f\n',b(1),bq(1));
fprintf(' b1   = %8.7f , %8.7f\n',b(2),bq(2));
fprintf(' b2   = %8.7f , %8.7f\n',b(3),bq(3));

% Quantized input signal
x = 2*rand(1,N)-ones(1,N);
xq = LSB*round(x/LSB); 

% Referenz system : 2nd order block with matlab default arithmetic
[yref,zref] = filter(bq,[aq(1) 2*aq(2) aq(3)],xq,xi);

% 2nd order block with fixed-point arithmetic
mode = [S1 S2];
[y,xio,OC,OC_y] = filt2_qa(bq,aq,xq,xi,LSB,mode);
%eval(['[y,xio,OC,OC_y] = filt2_' S1 S2 '(bq,aq,xq,xi,LSB);'])

% Indicate overflow
fprintf('\n')
fprintf('Total number of overflows  = %g\n',OC)
fprintf('Number of overflows at output signal = %g\n',OC_y)

% Graphics
FIG1 = figure('Name','scd3_3 : 2nd order block with quantized arithmetic',...
   'NumberTitle','off','Units','normal','Position',[.50 .40 .45 .50]);
subplot(1,1,1), plot(0:N-1,y,'o',0:N-1,yref,'x'); grid
xlabel('n \rightarrow'); ylabel('y[n] \rightarrow')


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

% Display results
fprintf('\n')
fprintf('output signal power             : %g dB\n',PyrefdB)
fprintf('error output signal power       : %g dB\n',PedB)
fprintf('SNR                             : %g dB\n',SNR)
% end