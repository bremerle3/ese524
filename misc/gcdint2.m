function [g,s,t] = gcdint2(b,c)
% 
% Compute the GCD g = (b,c) using the Euclidean algorithm
% and return s,t such that bs+ct = g
%
% function [g,s,t] = gcdint2(b,c)
%
% b,c = integers
% g = GCD(b,c)
% s,t = integers

% Copyright 1999 by Todd K. Moon

rm2 = b; rm1 = c;
sm2 = 1; sm1 = 0;
tm2 = 0; tm1 = 1;
while(rm1)
  q = floor(rm2/rm1);
  tr = rm2 - q*rm1;
  ts = sm2 - q*sm1;
  tt = tm2 - q*tm1;
  rm2 = rm1; sm2 = sm1; tm2 = tm1;
  rm1 = tr;  sm1 = ts;  tm1 = tt;
end
g = rm2;
s = sm2;
t = tm2;