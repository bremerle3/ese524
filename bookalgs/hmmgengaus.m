function [y,ss] = hmmgengaus(T,HMM)
% 
% Generate T outputs of a HMM with a Gaussian output distribution
%
% function y = hmmgengaus(T,HMM)
%
% T = number of outputs to produce
% HMM = model parameters
%
% y = output sequence
% ss = (optional) state sequence (for testing purposes)

% Copyright 1999 by Todd K. Moon

ir = rand;   % select the initial state with probability 
p = HMM.pi;
[m,m] = size(HMM.f{3,1});   % find the output vector size 
[S,S] = size(HMM.A);        % number of states
y = [];
if(nargout>1) ss=[]; end;
% Compute Cholesky factors first
for s=1:S
  HMM.f{4,s} = chol(HMM.f{3,s});
end
for t=1:T
  sr = rand;
  s = sum(sr>=cumsum([0;p]));           % select a state
  if(nargout>1) ss =[ss s]; end;
  p = HMM.A(:,s);
  y = [y HMM.f{4,s}'*randn(m,1) + HMM.f{2,s}];
end