function p = hmmf(y,f,s)
% 
% Determine the likelihood of the output y for the model HMM
% This function acts as a clearinghouse for different probability types
%
% function p = hmmf(y,f,s)
%
% y = output value
% f = probability distribution
% s = state
%
% p = likelihood

% Copyright 1999 by Todd K. Moon

if(f{1}==1)                             % discrete density
  p = hmmdiscf(y,f,s);
elseif(f{1}==2)                     % Gaussian density
  p = hmmgausf(y,f,s);
elseif(f{1}==3)                     % Gaussian mixture density
  p = hmmgmixf(y,f,s);
end