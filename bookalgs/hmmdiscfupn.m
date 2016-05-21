function f = hmmdiscfupn(y,alphahat,betahat,c,HMM)
% 
% Update the discrete HMM output distribution f using the normalized forward
% and backward probabilities alphahat and betahat
% 
% function f = hmmdiscfupn(y,alphahat,betahat,c,HMM)
%
% y = output sequence
% alphahat = normalized alphas
% betahat = normalized betas
% c = normalization constants
% HMM = current model parameters
%
% f = updated output distribution

% Copyright 1999 by Todd K. Moon

[S,S] = size(HMM.A);   [N,S] = size(HMM.f{2});  [m,T] = size(y);
f = HMM.f;
for t=1:T
  alphahatn(:,t) = alphahat(:,t)/c(t);
end

for s=1:S
  d = alphahatn(s,:) * betahat(s,:)';
  for i = 1:N
    idx = find(y==i);
    f{2}(i,s) = sum(alphahatn(s,idx) .* betahat(s,idx))/d;
  end
end