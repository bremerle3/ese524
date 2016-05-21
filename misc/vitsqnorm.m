function d = vitsqnorm(branch,input,state,nextstate)
% 
% Compute the square norm of the difference between inputs
% This function may be feval'ed for use with the Viterbi algorithm
% (state and nextstate are not used here)
%
% function d = vitsqnorm(branch,input,state,nextstate)

% Copyright 1999 by Todd K. Moon

d = norm(branch-input)^2;
