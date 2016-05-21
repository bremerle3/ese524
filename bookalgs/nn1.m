function [y,V,Y] = nn1(xn,w)
%
% Compute the output of a neural network with weights in w
%
% function [y,V,Y] = nn1(xn,w)
% 
% xn = input
% w = cell array of weights
%
% y = output layer output
% V = (optional) internal activity
% Y = (optional) neuron output
%    The optional arguments V and Y are used for training to store output for
%    each layer:
%    Y{1} = input, Y{2} = first hidden layer, etc.
%    V{1} = first hidden layer, etc.

% Copyright 1999 by Todd K. Moon

[n,L] = size(w);    % determine how many layers
[n,ninput] = size(w{1});   % determine input size
if(ninput ~= length(xn)+1) error('input data does not match weights'); end;
if(nargout >1)  % if optional output arguments, save the first as the input
  Y{1} = [1;xn];
end
y = xn;         % initial input
for l=1:L       % propagate the input forward
  v = w{l}*[1;y];
  y = phi(v);
  if(nargout > 1)
    V{l} = v;   
    if(l < L) Y{l+1} = [1;y]; else Y{l+1} = y; end;
  end;
end;

%---------------------------------------------------------------
function y = phi(v)
%
% The nonlinear function in the neural network
%
% function y = phi(v)

y = 1./(1+exp(-v));
