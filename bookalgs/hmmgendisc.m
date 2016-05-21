function [y,ss] = hmmgendisc(T,HMM)
% 
% Generate T outputs of a HMM with a discrete output distribution
%
% function y = hmmgendisc(T,HMM)
% 
% T = number of outputs to produce
% HMM = model parameters
%
% y = output sequence
% ss = (optional) state sequence (for testing purposes)

% Copyright 1999 by Todd K. Moon

ir = rand;          % select the initial state with probability 
p = HMM.pi;
q = HMM.f{2}*p;
ir = rand;
y = sum(ir>=cumsum([0;q]));
if(nargout>1) ir = rand;  s = sum(ir >= cumsum([0;p])); ss = s; end;
for t=2:T
  p = HMM.A*p;
  if(nargout>1) ir = rand;  s = sum(ir >= cumsum([0;p])); ss = [ss s]; end;
  q = HMM.f{2}*p;
  ir = rand;
  y = [y sum(ir>=cumsum([0;q]))];
end