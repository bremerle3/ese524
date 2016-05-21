function d = vitnop(branch,input)
% 
% Compute the norm of the difference between inputs
% This function may be feval'ed for use with the Viterbi algorithm
% In this case, the norm is simply taken as the branch number
%
% function d = vitnop(branch,input)
%

d = branch;
