function [H] = maketoeplitz(y,m,n)
% 
% Form a toeplitz matrix from the input data y
%
% function [H] = maketoeplitz(y,m,n)
%
% y = input data = [y1 y2 ...] (a series of vectors in a _row_)
% m = number of block rows in H
% n = number of block columns in H

% Copyright 1999 by Todd K. Moon

ny = length(y);
if(ny < n+m-1)
  error('Error: insufficient data for a Toeplitz matrix of this size');
end
 
H = [];
for i=1:m
  row = y(:,i+n-1:-1:i);
  H = [H;row];
end