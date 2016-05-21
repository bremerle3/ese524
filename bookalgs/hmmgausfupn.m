function f = hmmgausfupn(y,alphahat,betahat,c,HMM)
% 
% Update the Gaussian output distribution f of the HMM using the normalized
% probabilities alphahat and betahat
%
% function f = hmmgausfupn(y,alphahat,betahat,c,HMM)
%
% y = output sequence
% alphahat = normalized alphas
% betahat = normalized betas
% c = normalization constants
% HMM = current model parameters
%
% f = updated output distribution

% Copyright 1999 by Todd K. Moon

[S,S] = size(HMM.A);
[m,T] = size(y);
f = HMM.f;
for t=1:T
  alphahatn(:,t) = alphahat(:,t)/c(t);
end
for s=1:S
  d = alphahatn(s,:) * betahat(s,:)';
  mu = zeros(m,1);
  R = zeros(m,m);
  x = alphahatn(s,:).*betahat(s,:);
  for t=1:T
    mu = mu + x(t)*y(:,t);
% The following line is commented out in favor of its successor to attempt
% to stabilize the computations
%   R = R + x(t)*(y(:,t) - HMM.f{2,s})*(y(:,t) - HMM.f{2,s})';
    R = R + x(t)*diag((y(:,t) - HMM.f{2,s}).*(y(:,t) - HMM.f{2,s}));
  end
  f{2,s} = mu/d;
  f{3,s} = diag(diag(R))/d;
end