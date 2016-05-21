function [N,D] = ratinterp(ts,fs)  
% 
% Compute the rational function interpolation
% from the data in ts and fs.
% Polynomial coefficients returned in Matlab order (largest to smallest)

% function [N,D] = ratinterp(ts,fs)  
%
% ts = vector of independent data
% fs = vector of dependent data
%
% N = numerator coefficients
% D = denominator coefficients

% Copyright 1999 by Todd K. Moon

n = length(ts);
phis = invdiff(ts,fs);
% Build up the approximation from the bottom up
D = 1;
N = phis(n);
for j=n-1:-1:1
  oldD = D;
  D = N;                    % flip the last one upside down
  N = [0 oldD] - ts(j)*[oldD 0]; % multiply the polynomials
  k=1:length(D);
  N(k) = phis(j)*D(k) + N(k); % find the new numerator
end
N = N(length(N):-1:1);      % reverse to put in standard Matlab order
D = D(length(D):-1:1);