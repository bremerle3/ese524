function f = marv(x,fs)
% 
% Prony: given a sequence of (supposedly) pure sinusoidal data, 
% determine the frequency using model methods
%
% function f = marv(x,fs)
% x = data sequence
% fs = sampling rate
%
% f = frequencies found

% Copyright 1999 by Todd K. Moon

n = length(x)
nrows = n-2;
A = [];
b = [];
for i=1:nrows
  A = [A; x(i+1) x(i)];
  b = [b; x(i+2)];
end
A
b
a = pinv(A)*b;
r = roots([1 -a(1) -a(2)])
f = fs*abs(angle(r(1)))/(2*pi);

