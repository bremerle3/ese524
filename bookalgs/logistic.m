function y = logistic(x,lambda)
% 
% Compute the logistic function y = lambda*x*(1-x)
%
% function y = logistic(x,lambda)
%
% x = input value (may be a vector)
% lambda = factor of the function

% Copyright 1999 by Todd K. Moon

y = lambda.*x.* (1-x);