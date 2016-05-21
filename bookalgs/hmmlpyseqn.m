function lpy = hmmlpyseqn(y,HMM)
%
% Find the log likelihood of the sequence y[1],y[2],...,y[T],
% using the parameters in HMM.% That is, compute log P(y|HMM),
%
% function lpy = hmmlpyseqn(y,HMM)
%
% y = input sequence = y[1],y[2],\ldots,y[T]
% HMM = current estimate of HMM parameters
%
% lpy = log P(y|HMM)

% Copyright 1999 by Todd K. Moon

% P(y) = sum_{all legal final i} alpha(y_1^T,i)
%  = sum_{all legal final i} (prod_{l=1}^T c(l) alphahat(y_1^T,i),
% so
% log P(y) = -sum_{l=1}^T log(c(l)) + log(sum_{legal final i} alphahat(y_1^T,i))
 
[alphah, betah,f,c] = hmmabn(y,HMM);
lpy = -(sum(log(c)) + log(sum(alphah(logical(HMM.final),end))));