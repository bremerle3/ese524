function [y,ss] = hmmgendat(T,HMM)
% 
% Generate T outputs of a Hidden Markov model HMM
%
% function [y,ss] = hmmgendat(T,HMM)
%
% T = number of samples to produce
% HMM = HMM model parameters
%
% y = output sequence
% s = (optional) state sequence

% Copyright 1999 by Todd K. Moon

if(nargout>1) 
  if(HMM.f{1}==1)
    [y,ss] = hmmgendisc(T,HMM);
  elseif(HMM.f{1}==2)
    [y,ss] = hmmgengaus(T,HMM);
% The following are commented out because Gaussian mixtures are not
% currently implemented
%  else(HMM.f{1}==3)
%   [y,ss] = hmmgengausmix(T,HMM);
  end
else
  if(HMM.f{1}==1)
    y= hmmgendisc(T,HMM);
  elseif(HMM.f{1}==2)
    y = hmmgengaus(T,HMM);
%  else(HMM.f{1}==3)
%   y = hmmgengausmix(T,HMM);
  end
end