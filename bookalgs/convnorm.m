function d = convnorm(branch,input,state,nextstate)
%
% Compute the Hamming distance between the branchweights and the input
% This function may be feval'ed for use with the Viterbi algorithm
% (state and nextstate are not used here)
% 
% function d = convnorm(branch,input,state,nextstate)
% 
d = sum(r ~= branch)