function c = vitbestcost
% 
% Returns the best cost so far in the Viterbi algorithm
%
% function c = vitbestcost

% Copyright 1999 by Todd K. Moon

global pathcost; 
c = min(pathcost);
