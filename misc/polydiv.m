function [q,r] = polydiv(a,b) 
% 
% Divide a(x)/b(x), and return quotient and remainder in q and r
% Coefficients are assumed to be in Matlab standard order (highest order first)
%
%
% function [q,r] = polydiv(a,b)
%
% a = numerator
% b = denominator
%
% q = quotient
% r = remainder

% Copyright 1999 by Todd K. Moon
 
m = length(a);
n = length(b);
q = 0;
if(length(a)<length(b))
  r = a;
else
  for j=1:m-n+1
    q(j) = a(j)/b(1);
    for l=2:n
      a(l+j-1) = a(l+j-1) - q(j)*b(l);
    end
  end
  r = a(m-n+2:m);
  if(all(r==0))
    r = 0;
  else
    r = r(find((r==0)==0):end);         % get rid of leading zeros
  end
end