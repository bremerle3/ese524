function [H] = makehankel(y,m,n)
% 
% form a hankel matrix from the input data y
%
% [H] = makehankel(y,m,n)
%
% y = input data  = [y1 y2 ...] (a series of vectors in a _row_)
% m = number of block rows in H
% n = number of block columns in H
%
% H = Hankel matrix formed from y

% Copyright 1999 by Todd K. Moon

ny = length(y);
if(ny < n+m-1)
  error('Error: insufficient data for a Hankel matrix of this size');
end
H = [];
for i=1:m
  row = y(:,i:i+n-1);
  H = [H;row];
end