function hmmo = hmmupdaten(y,HMM)
%
% Compute updated HMM model from observations
%
% function HMM = hmmupdaten(y,HMM) 
%
% y = output sequence
% HMM = current model parameters
%
% hmmo = updated model parameters

% Copyright 1999 by Todd K. Moon

[alphahat,betahat,f,c] = hmmabn(y,HMM);    % find alpha and beta
[A,pi] = hmmApiupn(y,alphahat,betahat,f,HMM); % new Markov parameters
f = hmmfupdaten(y,alphahat,betahat,c,HMM);      % new output distribution parameters
hmmo.A = A;
hmmo.pi = pi;
hmmo.f = f;
hmmo.final = HMM.final;