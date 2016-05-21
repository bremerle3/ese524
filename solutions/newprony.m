function [a,r] = newprony(x,p)
% 
% Prony's method: Given a sequence of supposedly sinusoidal data with p
% modes, determine the  vector a of characteristic equation coefficients and
% modes --- the roots of the characteristic polynomial 
%
% function [a,r] = newprony(x,p)
% 
% x = sinusoidal data vector
% p = number of modes
%
% a = characteristic polynomial 
% r = roots of the characteristic polynomial

% Copyright 1999 by Todd K. Moon

N = length(x);
x = x(:);
A = [];
for i=1:N-p
  A = [A;x(i:i+p-1)'];
end
b = -x(p+1:N);
a = A\b;
a = [1;flipud(a)];
r = roots(a);




