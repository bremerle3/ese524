function hmmo = hmmupdate(y,HMM)
% 
% Compute updated HMM model from observations (nonnormalized)
%
% function HMM = hmmupdate(y,HMM) 
%
% y = output sequence
% HMM = current model parameters
%
% hmmo = updated model

% Copyright 1999 by Todd K. Moon

[alpha,beta,f] = hmmab(y,HMM);    % find alpha and beta
[A,pi] = hmmApiup(y,alpha,beta,f,HMM); % new Markov parameters
f = hmmfupdate(y,alpha,beta,HMM);       % new output distribution parameters
hmmo.A = A;
hmmo.pi = pi;
hmmo.f = f;
hmmo.final = HMM.final;