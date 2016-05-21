function f = hmmfupdate(y,alpha,beta,HMM)
% 
% Provide an update to the state output distributions for the HMM model
%
% function f = hmmfupdate(y,alpha,beta,HMM)
% 
% y = input sequence
% alpha = forward probabilities
% beta = backward probabilities
% HMM = current model parameters
% 
% f = updated distribution

% Copyright 1999 by Todd K. Moon

if(HMM.f{1}==1)                         % discrete output distribution
  f = hmmdiscfup(y,alpha,beta,HMM);
elseif(HMM.f{1}==2)       % Gaussian output distribution
  f = hmmgausfup(y,alpha,beta,HMM);
elseif(HMM.f{1}==3)       % Gaussian mixture output distribution
  f = hmmmgausfup(y,alpha,beta,HMM);
end