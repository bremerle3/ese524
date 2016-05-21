% Notes on data structures and functions for the HMM
% 

% Copyright 1999 by Todd K. Moon

%
% Data structures for the HMM
% HMM = HMM model
% HMM.pi = initial probabilities
% HMM.A = transition probabilities
% HMM.f = output probabilities
% HMM.final = vector of legal final states (e.g. [0 0 0 1 1]) (row vector)

% f{1} = integer indicator
%   1 = discrete
%   2 = Gaussian
%   3 = Gaussian mixture

% For discrete:
%  f{2} = output probability matrix
%    f{2}(ouput,state) = output probability

% For Gaussian:
%  f{2,state} = mean vector for state
%  f{3,state} = covariance matrix for state
%  f{4,state} = Cholesky factor of covariance (computed in hmmgengaus)

% For mixture Gaussian
%  f{2,mix,state} = mixture gain
%  f{3,mix,state} = mean
%  f{4,mix,state} = covariance

% input vectors are assumed to be stacks of columns:
% y = [y1 y2 ... yN]

% alpha = alpha(state,time)         beta = beta(state,time)

% Functions:
% Likelihood computation functions:
% function lpy = hmmlpyseqn(y,HMM) -- find the log likelihood of the sequence y
% function [alphah,betah,f,c] = hmmabn(y,HMM) --find alphahat, betahat, 
%         and output dist and scaling factors
% function p = hmmf(y,f,s) --find likelihood for output y and state s
% function p = hmmdiscf(y,f,s) --likelihood for output y and state s (discrete)
% function p = hmmgausf(y,f,s) --likelihood for output y and state s (Gaussian)

% Update functions (based upon scaled forward and backward probabilities)
% function HMM = hmmupdaten(y,HMM) --compute updated HMM model
% function [A,pi] = hmmApiupn(y,alphah,betah,f,HMM) -- update  A and pi
% function f = hmmfupdaten(y,alphah,betah,c,HMM)-- update output distribution
% function f = hmmdiscfupn(y,alphah,betah,c,HMM) --update discrete distribution
% function f = hmmgausfupn(y,alphah,betah,c,HMM) -- update Gaussian dist.

% Sequence generation functions:
% function [y,ss] = hmmgendat(T,HMM) -- generate T outputs of a HMM
% function [y,ss] = hmmgendisc(T,HMM) -- generate T discrete outputs
% function [y,ss] = hmmgengaus(T,HMM) -- generate T outputs of a Gaussian dist.

% Viterbi algorithm related functions
% function hmminitvit(HMM) -- set up the trellis information for VA computation
% function HMM = hmmupdatev(y,HMM) -- update HMM model using Viterbi methods
% function f = hmmupfv(y,statelist,n,f) -- update distribution usinv VA
% function lpy = hmmlpyseqv(y,HMM) -- log likelihood of y on the best path
% function c = vitbestcost -- return the best cost (log likelihood) in the VA