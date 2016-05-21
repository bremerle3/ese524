function f = hmmgausfup(y,alpha,beta,HMM)
% 
% Update the Gaussian output distribution f of the HMM using the
% probabilities alpha and beta
%
% function f = hmmgausfup(y,alpha,beta,HMM)
% 
% y = input sequence
% alpha = forward probabilities
% beta = backward probabilities
% HMM = current model parameters
% 
% f = updated distribution

% Copyright 1999 by Todd K. Moon

[S,S] = size(HMM.A);
[m,T] = size(y);
f = HMM.f;
for s=1:S
  d = alpha(s,:) * beta(s,:)';
  mu = zeros(m,1);
  R = zeros(m,m);
  x = alpha(s,:).*beta(s,:);
  for t=1:T
    mu = mu + x(t)*y(:,t);
%   R = R + x(t)*(y(:,t) - HMM.f{2,s})*(y(:,t) - HMM.f{2,s})';
    R = R + x(t)*diag((y(:,t) - HMM.f{2,s}).*(y(:,t) - HMM.f{2,s}));
  end
  f{2,s} = mu/d;
  f{3,s} = R/d;
end