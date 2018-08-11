function [y,xo,OC,OC_y]=filt2_qa(b,a,x,xi,LSB,mode)
% 2nd order block for IIR filter with quantizatized arithmetics
%
% [y,xo,OC,OC_y] = filt2_qa(b,a,x,xi,LSB,mode)
%   b   : (quantized) numerator coefficients   [b0 b1    b2]
%   a   : (quantized) denominator coefficients [1  .5*a1 a2] 
%   x   : input sequence
%   xi  : initial values for state space variables [xi1 xi2], typically [0,0]
%   LSB : least significant bit
%   mode: 'rc'...rounding and two's-complement overflow mode
%         'rs'...rounding and saturation overflow mode
%         'tc'...truncation and two's-complement overflow mode
%         'ts'...truncation and saturation overflow mode
%   y   : output sequence
%   xo  : sequences of state space variables
%         xo(1,:)=xi1[n] and xo(2,:)=xi2[n]
%   OC  : number of total overflows
%   OC_y: number of overflows for output signal y


% Memory allocation
N=length(x); xo=zeros(2,N+1); y=zeros(1,N); OC=0; OC_y=0;

% Initial values for state space variables
xo(1,1)=xi(1); xo(2,1)=xi(2); 

% Filtering with quantized arithmetics depending on mode
switch mode
    
case 'rc'
    
	% Filtering with rounding and two's-complement overflow mode
	for n=1:N
      % Output signal y[n] = b0*x[n] + xi1[n]
      p1   = b(1)*x(n); 
      p1   = LSB*round(p1/LSB);         % word length reduction
      y(n) = p1 + xo(1,n);
      if y(n)<-1 | y(n)>=1              % two's-complement overflow
        OC   = OC + 1;
        OC_y = OC_y  + 1;
        y(n) = y(n) - 2*sign(y(n));
      end % if
      % State space variable 1
      % xi1[n+1] = b1*x[n] + xi2[n] + (-a1/2)*y[n] + (-a1/2)*y[n]
      p1 = b(2)*x(n);
      p1 = LSB*round(p1/LSB);           % word length reduction
      p2 = -a(2)*y(n);
      p2 = LSB*round(p2/LSB);           % word length reduction
      xo(1,n+1) = p1 + xo(2,n) + p2 + p2;
      xo(1,n+1) = rem(xo(1,n+1),2);     % mod-2 overflow characteristic
      if xo(1,n+1)<-1 | xo(1,n+1)>= 1   % two's-complement overflow
        OC        = OC + 1;
        xo(1,n+1) = xo(1,n+1) - 2*sign(xo(1,n+1));
      end % if
      % State space variable 2
      % xi2[n+1] = b2*x[n] + (-a3)*y[n]
      p1 = b(3)*x(n);
      p1 = LSB*round(p1/LSB);           % word length reduction
      p2 = -a(3)*y(n);
      p2 = LSB*round(p2/LSB);           % word length reduction
      xo(2,n+1) = p1 + p2;
      if xo(2,n+1)<-1 | xo(2,n+1)>= 1   % two's-complement overflow
        OC        = OC + 1;
        xo(2,n+1) = xo(2,n+1) - 2*sign(xo(2,n+1));
      end % if
  end % for
      
case 'rs'
    
    % Filtering with rounding and saturation overflow mode
	for n=1:N
      % Output signal y[n] = b0*x[n] + xi1[n]
      p1   = b(1)*x(n); 
      p1   = LSB*round(p1/LSB);         % word length reduction
      y(n) = p1 + xo(1,n);
      if y(n)>=1                        % positive overflow
        OC   = OC + 1;
        OC_y = OC_y + 1;
        y(n) = 1 - LSB;                 % saturation characteristic
      elseif y(n)<-1                    % negative overflow
        OC   = OC + 1;
        OC_y = OC_y + 1;
        y(n) = -1;                      % saturation characteristic
      end % if
      % State space variable 1
      % xi1[n+1] = b1*x[n] + xi2[n] + (-a1/2)*y[n] + (-a1/2)*y[n]
      p1 = b(2)*x(n);
      p1 = LSB*round(p1/LSB);           % word length reduction
      p2 = -a(2)*y(n);
      p2 = LSB*round(p2/LSB);           % word length reduction
      xo(1,n+1) = p1 + xo(2,n) + p2 + p2;
      if xo(1,n+1)>= 1                  % positive overflow
        OC        = OC + 1;
        xo(1,n+1) = 1-LSB;              % saturation characteristic
      elseif xo(1,n+1)<-1               % negative overflow
        OC        = OC + 1;
        xo(1,n+1) = -1;                 % saturation characteristic
      end % if
      % State space variable 2
      % xi2[n+1] = b2*x[n] + (-a3)*y[n]
      p1 = b(3)*x(n);
      p1 = LSB*round(p1/LSB);           % word length reduction
      p2 = -a(3)*y(n);
      p2 = LSB*round(p2/LSB);           % word length reduction
      xo(2,n+1) = p1 + p2;
      if xo(2,n+1)>= 1                  % positive overflow
        OC        = OC + 1;
        xo(2,n+1) = 1 - LSB;            % saturation characteristic
      elseif xo(2,n+1)<-1               % negative overflow
        OC        = OC + 1;
        xo(2,n+1) = -1;                 % saturation characteristic
	  end % if
  end % for 
  
case 'tc'
    
    % Filtering with truncation and two's complement overflow mode
	for n=1:N
      % Output signal y[n] = b0*x[n] + xi1[n]
      p1 = b(1)*x(n); 
      p1 = LSB*fix(p1/LSB);             % word length reduction
      y(n) = p1+xo(1,n);
      if y(n)<-1 | y(n)>=1              % two's-complement overflow
        OC   = OC + 1;
        OC_y = OC_y + 1;
        y(n) = y(n) - 2*sign(y(n));
      end % if
      % State space variable 1
      % xi1[n+1] = b1*x[n] + xi2[n] + (-a1/2)*y[n] + (-a1/2)*y[n]
      p1 = b(2)*x(n);
      p1 = LSB*fix(p1/LSB);             % word length reduction
      p2 = -a(2)*y(n);
      p2 = LSB*fix(p2/LSB);             % word length reduction
      xo(1,n+1) = p1 + xo(2,n) + p2 + p2;
      xo(1,n+1) = rem(xo(1,n+1),2);     % mod-2 overflow characteristic
      if xo(1,n+1)<-1 | xo(1,n+1)>= 1   % two's-complement overflow
        OC        = OC + 1;
        xo(1,n+1) = xo(1,n+1) - 2*sign(xo(1,n+1)); 
      end % if
      % State space variable 2
      % xi2[n+1] = b2*x[n] + (-a3)*y[n]
      p1 = b(3)*x(n);
      p1 = LSB*fix(p1/LSB);             % word length reduction
      p2 = -a(3)*y(n);
      p2 = LSB*fix(p2/LSB);             % word length reduction
      xo(2,n+1) = p1 + p2;
      if xo(2,n+1)<-1 | xo(2,n+1)>= 1   % two's-complement overflow
        OC        = OC + 1;
        xo(2,n+1) = xo(2,n+1) - 2*sign(xo(2,n+1));
      end % if
	end % for
    
case 'ts'
    
    % Filtering with truncation and saturation characteristic
	for n=1:N
      % Output signal y[n] = b0*x[n] + xi1[n]
      p1   = b(1)*x(n); 
      p1   = LSB*fix(p1/LSB);           % word length reduction
      y(n) = p1 + xo(1,n);
      if y(n)>=1                        % positve overflow
        OC   = OC + 1;
        OC_y = OC_y + 1;
        y(n) = 1-LSB;                   % saturation characteristic
      elseif y(n)<-1                    % negative overflow
        OC   = OC + 1;
        OC_y = OC_y + 1;
        y(n) = -1;                      % saturation characteristic
      end % if
      % State space variable 1
      % xi1[n+1] = b1*x[n]+xi2[n] + (-a1/2)*y[n]+(-a1/2)*y[n]
      p1 = b(2)*x(n);
      p1 = LSB*fix(p1/LSB);             % word length reduction
      p2 = -a(2)*y(n);
      p2 = LSB*fix(p2/LSB);             % word length reduction
      xo(1,n+1) = p1 + xo(2,n) + p2 + p2;
      if xo(1,n+1)>= 1                  % positive overflow
        OC        = OC + 1;
        xo(1,n+1) = 1 - LSB;            % saturation characteristic
      elseif xo(1,n+1)<-1               % negative overflow
        OC        = OC + 1;
        xo(1,n+1) = -1;                 % saturation characteristic
      end % if
      % State space variable 2
      % xi2[n+1] = b2*x[n] + (-a3)*y[n]
      p1 = b(3)*x(n);
      p1 = LSB*fix(p1/LSB);             % word length reduction
      p2 = -a(3)*y(n);
      p2 = LSB*fix(p2/LSB);             % word length reduction
      xo(2,n+1) = p1 + p2;
      if xo(2,n+1)>= 1                  % positive overflow
        OC        = OC + 1;
        xo(2,n+1) = 1 - LSB;            % saturation characteristic
      elseif xo(2,n+1)<-1               % negative overflow
        OC = OC + 1;
        xo(2,n+1) = -1;                 % saturation characteristic
      end % if
	end % for
  
end  % switch

% end