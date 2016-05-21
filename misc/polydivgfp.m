function [q,r] = polydivgfp(a,b,p) 
% 
% Divide a(x)/b(x), and return quotient and remainder in q and r
% using arithmetic in GF(p)
% Coefficients are assumed to be in Matlab standard order (highest order first)
%
% function [q,r] = polydivgfp(a,b)
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
b1inv = mod(b(1)^(p-2),p);
for j=1:m-n+1
  q(j) = mod(a(j)*b1inv,p);
  for l=2:n
    a(l+j-1) = mod(a(l+j-1) - q(j)*b(l),p);
  end
end
r = mod(a(m-n+2:m),p);
if(all(r==0))
  r = 0;
end