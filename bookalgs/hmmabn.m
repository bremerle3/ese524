function [alphahat,betahat,f,c] = hmmabn(y,HMM)
% 
% compute the normalized forward and backward probabilities for the model HMM
% and the output probabilities and the normalization factor
%
% function [alphahat,betahat,f,c] = hmmabn(y,HMM)
%
% y = input sequence y[1],y[2], ..., y[T]
% HMM = HMM data
%
% alphahat = [ alphahat(:,1) alphahat(:,2) ... alphahat(:,T)]
%            (alphahat(:,t) = alphahat(y_t^T,:))
% betahat = [betahat(:,2) ... betahat(:,T-1) betahat(:,T) betahat(:,T+1)]
%            (betahat(:,t) = betahat(y_{t+1}^T|:))
% f = initial probability types
% c = normalizing factors

% Copyright 1999 by Todd K. Moon

[m,T] = size(y);
[S,S] = size(HMM.A);
betatilde = HMM.final;       % initial value=valid final states

for s=1:S                % find initial alpha
    f(1,s) = hmmf(y(:,1),HMM.f,s);
end
alphatilde = f(1,:)' .* HMM.pi;
c(1) = 1/sum(alphatilde);
alphahat = alphatilde*c(1);
for t=2:T
  for s=1:S
    f(t,s) = hmmf(y(:,t),HMM.f,s);
  end
  alphatilde = f(t,:)' .* (HMM.A*alphahat(:,t-1));
  c(t) = 1/sum(alphatilde);
  alphahat = [alphahat alphatilde*c(t)];
end
betahat = c(T)*betatilde';
for t=T:-1:2
  betatilde = HMM.A' * (betahat(:,1) .* f(t,:)');
  betahat = [c(t-1)*betatilde betahat];
end