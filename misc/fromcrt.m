function [x,gamma] = fromcrt(y,m,gammain)
% 
% Given a sequence [y1,y2,\ldots,y2] that is a representation 
% of an integer x in CRT form, convert back to x.
%
% function x = fromcrt(y,m)
%
% y = sequence
% m = [m1,m2,...,mr]
% gammain (optional) = set of gamma factors.  
%   If not passed in, gamma is computed
%
% x = integer representation
% gamma = gamma values

% Copyright 1999 by Todd K. Moon

r = length(y);
if(nargin==2)
  mp = prod(m);
  x = 0;
  for i=1:r
    [g,b,y1] = gcdint2(mp/m(i),m(i));
    gamma(i) = mp/m(i)*b;
    x = x + gamma(i)*y(i);
  end
else
  x = gammain*y';
  gamma = gammin;
end
x = mod(x,mp);