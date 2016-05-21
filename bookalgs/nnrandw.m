function w = nnrandw(m)
% 
% Generate an initial set of weights for a neural network at random,
% based upon the list in m
%
% function w = nnrandw(m)
% m = list of weights 
%   m(1) = number of inputs, m(2) = first hidden layer, etc.
%
% w = random weights

% Copyright 1999 by Todd K. Moon

L = length(m)-1;
for l=1:L
  w{l} = rand(m(l+1),m(l)+1);
end