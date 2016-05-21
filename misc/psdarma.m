function [w,h] = psdarma(b,a)
%
% Plot the psd of an arma model
%
% function [w,h] = psdarma(b,a)
%
% b = numerator coefficients
% a = denominator coefficients
%
% w = frequency values
% h = absolute value of response

% Copyright 1999 by Todd K. Moon

Npts = 512;
w = linspace(0,2*pi,Npts);
j = sqrt(-1);
z = exp(-j*w);
h = (abs(polyval(b,z)).^2 ./ abs(polyval(a,z))).^2;
plot(w/(pi),10*log10(h));
xlabel('normalized frequency (Nyquist==1)')
ylabel('Magnitude (dB)');