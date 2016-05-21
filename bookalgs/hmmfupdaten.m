function f = hmmfupdaten(y,alphahat,betahat,c,HMM)
% 
% Provide an update to the state output distributions for the HMM model
% using the normalized probabilities alphahat and betahat
%
% function f = hmmfupdaten(y,alphahat,betahat,HMM)
%
% y = output sequence
% alphahat = normalized alphas
% betahat = normalized betas
% c = normalization factors
% HMM = current model paramters
%
% f = updated output distribution

% Copyright 1999 by Todd K. Moon

if(HMM.f{1}==1)                         % discrete output distribution
  f = hmmdiscfupn(y,alphahat,betahat,c,HMM);
elseif(HMM.f{1}==2)       % Gaussian output distribution
  f = hmmgausfupn(y,alphahat,betahat,c,HMM);
elseif(HMM.f{1}==3)       % Gaussian mixture output distribution
  f = hmmmgausfupn(y,alphahat,betahat,c,HMM);
end