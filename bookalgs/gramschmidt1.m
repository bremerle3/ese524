function [Q,R] = gramschmidt1(A)
% 
% Compute the Gram-Schmidt orthogonalization of the 
% columns of A, assuming nonzero columns of A
%
% function [Q,R] = gramschmidt1(A)
%
% A = input matrix to be factored (assuming nonzero columns)
%
% Q = orthogonal matrix
% R = upper triangular matrix such that A = QR

% Copyright 1999 by Todd K. Moon

[m,n] = size(A)
R = [];  Q = [];       % initialize
e1 = A(:,1);           % first vector= first column of A
R(1,1) = norm(e1);     % normalizing factor
  Q = e1/R(1,1);       % normalized vector
for k=2:n
  R(1:k-1,k) = Q(:,1:k-1)'*A(:,k);     % orthogonal projection coefficients
  ek = A(:,k) - Q(:,1:k-1)*R(1:k-1,k); % orthogonal direction vector
  R(k,k) = norm(ek);                   % new normalization
  if(R(k,k))           
    ek = ek/R(k,k)                     % new orthogonal vector
  end
  Q = [Q ek];
end