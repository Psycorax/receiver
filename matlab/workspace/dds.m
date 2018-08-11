function y = dds(Table, Increment, nvalues, IncrementLSB)
% y = dds(Table, Increment, nvalues)
% Outputs a dds signal of length nvalues based on a given table of values
% Table         The stored signal values
% Increment     The phase increment
% nvalues       The number of values to generate
% PhaseLSB      LSB of phase increment

TableLen = length(Table);

y = zeros(1,nvalues);

if (Increment/IncrementLSB ~= floor(Increment/IncrementLSB) )
    error('Icrement must be a fixed point value!!!!');
end

if ( mod(Increment,2^-TableLen) ~= 0) 
    disp('Warning In dds.m: Table Adress rounded')
end

% start adressing at -1
PhaseAccumulator = -1;

for k = 1:nvalues   
  % +1 because matlab adressing starts an 1    
  TableIndex = floor((PhaseAccumulator+1)/2*TableLen+1);  
  y(1,k) = Table(TableIndex);
  
   % update phase accumulator
  PhaseAccumulator = PhaseAccumulator + Increment;
  if PhaseAccumulator >= 1
    PhaseAccumulator = -1 + (PhaseAccumulator-1);
  end   
end