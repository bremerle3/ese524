function gamma = crtgamma(m)
% 
% Compute the gammas for the CRT
%
% function gamma = crtgamma(m)
%
% m = set of modulos
%
% gamm = set of gammas

% Copyright 1999 by Todd K. Moon

r = length(m);
mp = prod(m);
for i=1:r
  [g,b,y1] = gcdint2(mp/m(i),m(i));
  gamma(i) = mp/m(i)*b;
end