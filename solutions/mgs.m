function [Q,R] = mgs(A)
% 
% Compute the Gram-Schmidt orthogonalization of the 
% columns of A, assuming nonzero columns of A
% using the modified Gram-Schmidt algorithm.  A = QR
% 
% function [Q,R] = mgs(A)
%
% A = matrix to be factored
%
% Q = orthogonal matrix
% R = upper triangular

% Copyright 1999 by Todd K. Moon

[m,n] = size(A)
R = [];  Q = [];       % initialize
for k=1:n
  R(k,k) = norm(A(:,k));
  if(R(k,k))
    Q(:,k) = A(:,k)/R(k,k);
  else
    Q(:,k) = zeros(m,1);
  end
  for j=k+1:n
    R(k,j) = Q(:,k)'*A(:,j);
    A(:,j) = A(:,j) - Q(:,k)*R(k,j);
  end
end