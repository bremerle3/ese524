function p = qf(x)
% 
% Compute the Q function:
%
% function p = qf(x)
%   p = 1/sqrt(2pi)int_x^infty exp(-t^2/2)dt

% Copyright 1999 by Todd K. Moon

p = 0.5*erfc(x/sqrt(2));
