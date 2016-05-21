function f = chi2(x,n)
% 
% Compute the pdf for a chi-squared random variable
%
% function f = chi2(x,n)
%
% x = value
% n = order of chi-squared
%
% f = pdf value

% Copyright 1999 by Todd K. Moon

f = x .^(n/2-1) .* exp(-x/2) / (gamma(n/2)*2^(n/2));