function phis = invdiff(ts,fs)
% 
% Compute the inverse differences for a rational interpolation function,
% returning the vector of inverse differences that are necessary for
% interpolation
%
% function phis = invdiff(ts,fs)
%
% ts = vector of independent variable
% fs = vector of dependent variable
%
% phis = inverse differences

% Copyright 1999 by Todd K. Moon

n = length(ts);
phis = fs;
for i=1:n-1
  for j=i+1:n
    if(phis(i)==phis(j)) 
      fprintf(1,'denom zero: i=%d  j=%d num=%f\n',i,j,ts(i)-ts(j));
    else
      phis(j) = (ts(i) - ts(j))/(phis(i) - phis(j));
    end
  end
end