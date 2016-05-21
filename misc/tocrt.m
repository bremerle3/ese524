function y = tocrt(x,m)
% 
% Compute the representation of the scalar x using the
% using the Chinese Remainder Theorem (CRT) with
% moduli m = [m1,m2,...,mr].  It is assumed (without checking)
% that the moduli are relatively prime
%
% function y = tocrt(x,m)
%
% x = number to convert
% m = set of moduli
%
% y = CRT representation of x

% Copyright 1999 by Todd K. Moon


y = mod(x,m);

