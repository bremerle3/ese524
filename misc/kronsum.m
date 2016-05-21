function C = kronsum(A,B)
%
% Kronecker sum of A and B.  A and B are assumed square.
%
% function C = kronsum(A,B).  

% Copyright 1999 by Todd K. Moon

[m,m] = size(A);  [n,n] = size(B);
C = kron(eye(n),A) + kron(eye(m),B);