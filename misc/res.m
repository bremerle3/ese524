function d = res(a,n,m)
% 
% Computes <a^n>_m
%
% function d = res(a,n,m)
%
% a = value
% n = exponent
% m = modulo
%
% d = remainder(a^n,m0

% Copyright 1999 by Todd K. Moon

d = rem(a,m);
for i=2:n
  d = rem(d*a,m);
end