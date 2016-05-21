function d = hmmnorm(branchweight,y,state,nextstate)
% 
% Compute the branch norm for the HMM using the Viterbi approach
%
% function d = hmmnorm(branchweight,y,state,nextstate)
%
% branchweight= log transition probability 
% y = output
% state = current state in trellis
% nextstate = next state in trellis
%
% d = branch norm (log-likelihood)

% Copyright 1999 by Todd K. Moon

global vHMM;
pout = hmmf(y,vHMM.f,state);
if(pout==0)
  lp = -realmax;
else
  lp = log(pout);
end
d = branchweight - lp;