function [A,pi] = hmmApiup(y,alpha,beta,f,HMM)
% 
% Update the A and pi probabilities in the HMM using the forward and
% backward probabilities alpha and beta
%
% function [A,pi] = hmmapiup(y,alpha,beta,HMM)
%
% y = input sequence
% alpha = forward probability
% beta = backward probability
% f = distribution
% HMM = model parameters
%
% A = updated state transition probability
% pi = updated initial state probability

% Copyright 1999 by Todd K. Moon

[S,S] = size(HMM.A);        [m,T] = size(y);
A = HMM.A;
for j=1:S     % from state
  d = alpha(j,1:end-1) * beta(j,1:end-1)'; % denominator
  for i=1:S                 % to state
     as = sum(HMM.A(i,j) *(alpha(j,1:end-1) .* f(2:end,i)' .* beta(i,2:end)));
     A(i,j) = as/d;
  end
end
Pym = sum(alpha(:,1).* beta(:,1));
pi = alpha(:,1).*beta(:,1)/Pym;