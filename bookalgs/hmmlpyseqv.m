function lpy = hmmlpyseqv(y,HMM)
% 
% Find the log likelihood of the sequence y[1],y[2],...,y[T]
% i.e., compute log P(y|HMM),
% using the the Viterbi algorithm
%
% function lpy = hmmlpyseqv(y,HMM)
%
% y = input sequence
% HMM = HMM parameters
%
% lpy = log likelihood value

% Copyright 1999 by Todd K. Moon

[n,n] = size(HMM.A);
hmminitvit(HMM,3*n);
plist = [];
for yk = y
  p = viterbi1(yk);
  if(p) plist = [plist p]; end
end
plist = [plist vitflush(find(HMM.final ~= 0))]; % flush to valid final states
lpy = -vitbestcost;