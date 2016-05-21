function [alpha,beta,f] = hmmab(y,HMM)
% 
% Compute the forward and backward probabilities for the model HMM
% and the output probabilities

% function [alpha,beta,f] = hmmab(y,HMM)
%
% y = input sequence
% HMM = current model parameters
%
% alpha = [ alpha(:,1) alpha(:,2) ... alpha(:,T)]
%            (alpha(:,t) = alpha(y_t^T,:))
% beta = [beta(:,2) ... beta(:,T-1) beta(:,T) beta(:,T+1)]
%            (beta(:,t) = beta(y_{t+1}^T|:))
% f = distributions

% Copyright 1999 by Todd K. Moon

[m,T] = size(y);
[S,S] = size(HMM.A);
betan = HMM.final;       % initial value=valid final states
beta = betan';

for s=1:S                % find initial alpha
    f(1,s) = hmmf(y(:,1),HMM.f,s);
end
alphan = f(1,:)' .* HMM.pi;
alpha = alphan;

for t=2:T
  for s=1:S
    f(t,s) = hmmf(y(:,t),HMM.f,s);
  end
  alphan = f(t,:)' .* (HMM.A*alphan);
  alpha = [alpha alphan];
end
for t=T:-1:2
  betan = (betan .* f(t,:)) * HMM.A;
  beta = [betan' beta];
end