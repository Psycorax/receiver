function [y,OC,OC_y]=filtfir_symm_qa(h,x,xi,LSB,mode)
% Symmetric FIR filter implementation with quantized arithmetics
% (linear phase structure)
%
% [y,OC,OC_y]=filtfir_symm_qa(h,x,xi,LSB,mode)
%   h   : (quantized) impulse response coefficients   [h0 b1    bN]
%   x   : input sequence
%   xi  : initial values for state space variables [x(-N),...,x(-1)], typically [0,0,   ,0]
%   LSB : least significant bit
%   mode: 'rc'...rounding and two's-complement overflow mode
%         'rs'...rounding and saturation overflow mode
%         'tc'...truncation and two's-complement overflow mode
%         'ts'...truncation and saturation overflow mode
%   y   : output sequence
%   OC  : number of total overflows
%   OC_y: number of overflows at filter output


% Memory allocation
K=length(x); N = length(h)-1; y=zeros(1,K); OC=0; OC_y = 0;

disp('Reference Coefficients');
format long;
h.'
format short;

% round coefficients
if mode(1) == 'r'
    h = LSB.*round(h./LSB);
else
    h = LSB.*fix(h./LSB);
end

% truncate or staturate coefficients
if mode(2) == 'c'
    for n = 1:N
        if h(n) <-1 | h(n)>=1                
            h(n) = h(n) - 2*sign(b(n));
        end
    end
else
    for n = 1:N
        if h(n)>=1                        % positve overflow                
            h(n) = 1-LSB;                  % saturation characteristic
        elseif h(n)<-1                    % negative overflow
                h(n) = -1;                     % saturation characteristic
        end % if
    end
end

disp('Quantized Coefficients');
LSB
format long;
h.'
format short;


% Filtering with quantized arithmetics depending on mode
switch mode
    
case 'rc'
    
    % Filtering with rounding and two's-complement overflow mode
    x = [xi,x,zeros(1,N)];
	for n=N+1:K+N
      % Output signal y[n] = h0*x[n] + h1*x[n-1] + ... + hN*x[n-N]
      if mod(N,2) == 0 % even N
          for i=1:N/2+1
               if i ~= N/2+1
                  s(i) = x(n-i+1) + x(n-N+i-1);
               else
                  s(i) = x(n-N/2);
               end % if
               if s(i)<-1 | s(i)>=1              % two's-complement overflow
                  OC   = OC + 1;
                  s(i) = s(i) - 2*sign(s(i));
               end % if
               p(i) = h(i)*s(i);
               p(i) = LSB*round(p(i)/LSB);       % word length reduction
           end % for
       else % odd N
           for i=1:floor(N/2)+1
               s(i) = x(n-i+1) + x(n-N+i-1);
               if s(i)<-1 | s(i)>=1              % two's-complement overflow
                  OC   = OC + 1;
                  s(i) = s(i) - 2*sign(s(i));
               end % if
               p(i) = h(i)*s(i);
               p(i) = LSB*round(p(i)/LSB);       % word length reduction
           end % for
       end % if
       m = n-N;
       y(m) = sum(p);
       if y(m)<-1 | y(m)>=1                      % two's-complement overflow
          OC   = OC + 1;
          OC_y   = OC_y + 1;
          y(m) = y(m) - 2*sign(y(m));
       end % if
	end  % for
    
case 'rs'
    
    % Filtering with rounding and saturation overflow mode
    x = [xi,x,zeros(1,N)];
	for n=N+1:K+N
      % Output signal y[n] = h0*x[n] + h1*x[n-1] + ... + hN*x[n-N]
      if mod(N,2) == 0 % even N
          for i=1:N/2+1
               if i ~= N/2+1
                  s(i) = x(n-i+1) + x(n-N+i-1);
               else
                  s(i) = x(n-N/2);
               end % if
               if s(i)>=1                        % positve overflow
                  OC   = OC + 1;
                  s(i) = 1-LSB;                  % saturation characteristic
               elseif s(i)<-1                    % negative overflow
                  OC   = OC + 1;
                  s(i) = -1;                     % saturation characteristic
               end % if
               p(i) = h(i)*s(i);
               p(i) = LSB*round(p(i)/LSB);       % word length reduction
           end % for
       else % odd N
           for i=1:floor(N/2)+1
               s(i) = x(n-i+1) + x(n-N+i-1);
               if s(i)>=1                        % positve overflow
                  OC   = OC + 1;
                  s(i) = 1-LSB;                  % saturation characteristic
               elseif s(i)<-1                    % negative overflow
                  OC   = OC + 1;
                  s(i) = -1;                     % saturation characteristic
               end % if
               p(i) = h(i)*s(i);
               p(i) = LSB*round(p(i)/LSB);       % word length reduction
           end % for
       end % if
       m = n-N;
       y(m) = sum(p);
       if y(m)>=1                                % positve overflow
          OC   = OC + 1;
          OC_y   = OC_y + 1;
          y(m) = 1-LSB;                          % saturation characteristic
       elseif y(m)<-1                            % negative overflow
          OC   = OC + 1;
          OC_y   = OC_y + 1;
          y(m) = -1;                             % saturation characteristic
       end % if
	end  % for
    
case 'tc'
    
    % Filtering with truncation and two's-complement overflow mode
    x = [xi,x,zeros(1,N)];
	for n=N+1:K+N
      % Output signal y[n] = h0*x[n] + h1*x[n-1] + ... + hN*x[n-N]
      if mod(N,2) == 0 % even N
          for i=1:N/2+1
               if i ~= N/2+1
                  s(i) = x(n-i+1) + x(n-N+i-1);
               else
                  s(i) = x(n-N/2);
               end % if
               if s(i)<-1 | s(i)>=1              % two's-complement overflow
                  OC   = OC + 1;
                  s(i) = s(i) - 2*sign(s(i));
               end % if
               p(i) = h(i)*s(i);
               p(i) = LSB*fix(p(i)/LSB);         % word length reduction
           end % for
       else % odd N
           for i=1:floor(N/2)+1
               s(i) = x(n-i+1) + x(n-N+i-1);
               if s(i)<-1 | s(i)>=1              % two's-complement overflow
                  OC   = OC + 1;
                  s(i) = s(i) - 2*sign(s(i));
               end % if
               p(i) = h(i)*s(i);
               p(i) = LSB*fix(p(i)/LSB);         % word length reduction
           end % for
       end % if
       m = n-N;
       y(m) = sum(p);
       if y(m)<-1 | y(m)>=1                      % two's-complement overflow
          OC   = OC + 1;
          OC_y   = OC_y + 1;
          y(m) = y(m) - 2*sign(y(m));
       end % if
	end  % for
    
case 'ts'
    
    % Filtering with truncation and saturation overflow mode
    x = [xi,x,zeros(1,N)];
	for n=N+1:K+N
      % Output signal y[n] = h0*x[n] + h1*x[n-1] + ... + hN*x[n-N]
      if mod(N,2) == 0 % even N
          for i=1:N/2+1
               if i ~= N/2+1
                  s(i) = x(n-i+1) + x(n-N+i-1);
               else
                  s(i) = x(n-N/2);
               end % if
               if s(i)>=1                        % positve overflow
                  OC   = OC + 1;
                  s(i) = 1-LSB;                  % saturation characteristic
               elseif s(i)<-1                    % negative overflow
                  OC   = OC + 1;
                  s(i) = -1;                     % saturation characteristic
               end % if
               p(i) = h(i)*s(i);
               p(i) = LSB*fix(p(i)/LSB);         % word length reduction
           end % for
       else % odd N
           for i=1:floor(N/2)+1
               s(i) = x(n-i+1) + x(n-N+i-1);
               if s(i)>=1                        % positve overflow
                  OC   = OC + 1;
                  s(i) = 1-LSB;                  % saturation characteristic
               elseif s(i)<-1                    % negative overflow
                  OC   = OC + 1;
                  s(i) = -1;                     % saturation characteristic
               end % if
               p(i) = h(i)*s(i);
               p(i) = LSB*fix(p(i)/LSB);         % word length reduction
           end % for
       end % if
       m = n-N;
       y(m) = sum(p);
       if y(m)>=1                                % positve overflow
          OC   = OC + 1;
          OC_y   = OC_y + 1;
          y(m) = 1-LSB;                          % saturation characteristic
       elseif y(m)<-1                            % negative overflow
          OC   = OC + 1;
          OC_y   = OC_y + 1;
          y(m) = -1;                             % saturation characteristic
       end % if
	end  % for
    
end % switch
% end