function g = gcdint1(b,c)
% 
% Compute (only) the GCD (a,b) using the Euclidean algorithm
%
% function g = gcdint1(b,c)
%
% b,c = integers
%
% g = GCD(b,c)

% Copyright 1999 by Todd K. Moon

while(c)
  g = c;
  c = rem(b,c);
  b = g;
end