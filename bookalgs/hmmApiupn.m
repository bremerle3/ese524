function [A,pi] = hmmApiupn(y,alphahat,betahat,f,HMM)
% 
% update the HMM probabilities A and pi using the normalized forward and
% backward probabilities alphahat and betahat
%
% function [A,pi] = hmmapiupn(y,alphahat,betahat,HMM)
%
% y = input sequence
% alphahat = normalized alphas
% betahat = normalized betas
% HMM = current model parameters
%
% A = updated transition probability matrix
% pi = updated initial probability matrix

% Copyright 1999 by Todd K. Moon

[S,S] = size(HMM.A);        [m,T] = size(y);
A = HMM.A;
for j=1:S     % from state
  for i=1:S         % to state
  as(i,1)=sum(HMM.A(i,j)*(alphahat(j,1:end-1).*f(2:end,i)'.*betahat(i,2:end)));
  end
  A(:,j) = as/sum(as);
end
Pym = sum(alphahat(:,1).* betahat(:,1));
pi = alphahat(:,1).*betahat(:,1)/Pym;