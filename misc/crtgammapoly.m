function gamma = crtgammapoly(m)
% 
% Compute the gammas for the CRT for polynomials
%
% function gamma = crtgammapoly(m)
%
% m = set of modulos (polynomials)
%
% gamma = set of gammas (polynomials)

% Copyright 1999 by Todd K. Moon

r = length(m);
mp = 1;
for i=1:r
  mp = polymult(mp,m{i});
end
for i=1:r
  [q,rm] = polydiv(mp,m{i});
  [g,b,y1] = gcdpoly(q,m{i});
  gamma{i} = polymult(q,b);
end