% ############################ scd3_1: Fixed point arithmetik ############################
% limit cycles due to round-off in 2nd order block with quantized
% coefficients and fixed-point arithmetic
% used functions: filt2_rc.m, filt2_rs.m, filt2_tc.m, filt2_ts.m

clear all
close all

% Input of simulation parameters
fprintf('\n')
fprintf('scd3_1 : limit cycles due to round-off * February 2001 * mw \n')
fprintf('\n')
S1  = input('round or truncate to zero ..................... (r)/t ? ','s');
S2  = input('two´s complement or saturation ................ (c)/s ? ','s');
WL  = input('word length in bits............................. (16) ? ');
N   = input('number of simulation cycles ................... (200) ? ');
b   = input('numerator b ............................... ([1 0 0]) ? ');
a   = input('denominator a ..................... ([1,-1.9,0.9025]) ? ');
A   = input('amplitude of input impulse................... (0.001) ? ');
xi  = input('initial values for state space variables..... ([0 0]) ? ');
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
  N = 200;
end
if isempty(b)
  b = [1 0 0];
end
if isempty(a)
  a = [1,-1.9,0.9025];
end
if isempty(A)
  A = .001;
end
if isempty(xi)
  xi = [0 0];
end

% Constants for fixed-point arithmetic
LSB  = 2^(-WL+1); % least significant bit (LSB)

% Poles
poles = roots(a)

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
x = [A,zeros(1,N-1)];
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

% Search for limit cycle
fprintf('search for limit cycle')
start=0; period=0; k=1;
while k<=N
  k = k+1;
  for m = k+1:N
    if xio(1,k) == xio(1,m) & xio(2,k) == xio(2,m)
       start  = k; 
       period = m-k;
       fprintf('- limit cycle detected \n')
       fprintf('start  : %g    period : %g\n',start,period)
       k = N+1;
       break
    end
  end
end

% Graphics
FIG1 = figure('Name','dsplab16_1 : 2nd order block with quantized arithmetic',...
   'NumberTitle','off','Units','normal','Position',[.50 .40 .45 .50]);
subplot(2,1,1), plot(0:N-1,y,'o',0:N-1,yref,'x'); grid
xlabel('n \rightarrow'); ylabel('y[n] \rightarrow')
if start~=0   % limit cycle detected
  n1=start; n2=start+period;
  subplot(2,1,2)
  plot(xio(1,n1:n2)/LSB,xio(2,n1:n2)/LSB,'ro',xio(1,n1:n2)/LSB,xio(2,n1:n2)/LSB,'b')
  grid; title(['limit cycle with periode ',num2str(period)]);
  xlabel('x_1[n]/LSB \rightarrow'); ylabel('x_2[n]/LSB \rightarrow')
else
  fprintf('- no limit cycle detected\n')
end

% end