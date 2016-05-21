function lpy = hmmlpyseq(y,HMM)
%
% Find the log likelihood of the sequence y[1],y[2],...,y[T], 
% i.e., compute log P(y|HMM)
%
% function lpy = hmmlpyseq(y,HMM)
%
% y = input sequence
% HMM = current model parameters

% Copyright 1999 by Todd K. Moon

[alpha, beta, f] = hmmab(y,HMM);
lpy = log(sum(alpha(logical(HMM.final),end)));