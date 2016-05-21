function y = tocrt(f,m)
% 
% Compute the representation of the polynomial f using the
% using the Chinese Remainder Theorem (CRT) with
% moduli m = {m1,m2,...,mr}.  It is assumed (without checking)
% that the moduli are relatively prime.
% m is passed in as a cell array containing polynomial vectors
% and y is returned as a cell array containing polynomial vectors
%
% function y = tocrt(f,m)
%
% f = polynomial
% m = set of modulo polynomials
%
% y = CRT form of f

% Copyright 1999 by Todd K. Moon

[n,r] = size(m);
for i=1:r
  [q,y{i}] = polydiv(f,m{i});
end

