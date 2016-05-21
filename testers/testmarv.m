% Test the Prony's method in marv.m
% Copyright 1999 by Todd K. Moon

fs = 100;   % sample rate
Ts = 1/fs;
N = 100;     % number of points
f1 = 5;     % true frequency value
x = 4*sin( 2*pi*(1:N)*Ts*f1 + .2);  % sample data
x = x + .05*randn(size(x));
plot((1:N)*Ts,x)
f = marv(x,fs)
