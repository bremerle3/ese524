function D = diagstack(X,Y)
% Stack matrices diagonally:
% D = [X 0
%      0 Y];
%
% function D = diagstack(X,Y)
% X, Y = input matrices
%
% D = diagonal stack

% Copyright 1999 by Todd K. Moon

[i,j] = size(X); [k,l] = size(Y);
D = [X zeros(i,l);
     zeros(k,j) Y];
