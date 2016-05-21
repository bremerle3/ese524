function [a,sigma] = fblp(x, n)
%
% Forward-backward linear predictor
%
% function [a,sigma] = fblp(x,n)
%
% Given a sequence of data in the columns vector x, 
% return the coefficients of an nth order forward-backward linear predictor in a
%
% x = data sequence
% n = length of filter
%
% a = filter coefficients
% sigma = standard deviation of noise

% Copyright 1999 by Todd K. Moon

N = length(x);
% Build the data matrix
X = [];
for i=1:N-n  % forward part
  X = [X;x(n+i-1:-1:i).'];
end
d = [x(n+1:N)];
for i=1:N-n  % reverse part
  X = [X;x(i+1:i+n)'];   % remember '=conjugate transpose
end
d = [d;conj(x(1:N-n))];
a = pinv(X)*d;  % solve using pseudoinverse
sigma = sqrt(real(d'*d - d'*X*a)/2)