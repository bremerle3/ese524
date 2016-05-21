function hmmo = hmmupdatev(y,HMM)
% 
% Compute updated HMM model from observations y using Viterbi methods
% Assumes only a single observation sequence.
%
% function HMM = hmmupdatev(y,HMM) 
%
% y = sequence of observations
% HMM = old HMM (to be updated)
%
% hmmo = updated HMM

% Copyright 1999 by Todd K. Moon

hmmo = HMM;
[n,n] = size(hmmo.A);
[d,T] = size(y);
hmminitvit(HMM,3*n);
% find state sequence
plist = [];
for yk = y
  p = viterbi1(yk);
  if(p) plist = [plist p]; end
end
plist = [plist vitflush(find(HMM.final ~= 0))]; % flush to valid final states

% Now update the transition probabilities and initial probabilities
hmmo.pi = 0*hmmo.pi; 
hmmo.pi(plist(1)) = 1;      % initial probability based on observation
for state=1:n
  for nextstate=1:n
    ntrans = sum(plist(1:T-1)==state & plist(2:T) == nextstate);
    nfrom = sum(plist(1:T-1)==state);
    if(nfrom) hmmo.A(nextstate,state) = ntrans/nfrom; end
  end
end
hmmo.f = hmmupfv(y,plist,n,HMM.f);  % update the distribution