function y = bssg(v)
%
% The nonlinear function in the neural network
%
% function y = bssg(v).  

% Copyright 1999 by Todd K. Moon

y = 1./(1+exp(-v));
