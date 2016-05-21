function [Q,R] = gramschmidt2(A)
% 
% Modified Gram-Schmidt: Compute the Gram-Schmidt orthogonalization of the 
% columns of A, A = QR
%
% function [Q,R] = gramschmidt2(A)
%
% A = matrix to be factored
%
% Q = orthogonal matrix
% R = upper triangular matrix

% Copyright 1999 by Todd K. Moon

[m,n] = size(A);
R = [];  Q = [];       % initialize
e1 = A(:,1);  R(1,1) = norm(e1);  Q = e1/R(1,1);
k1 = 2;                % k1 counts dimensions with new information
for k=2:n
  r = Q(:,1:k1-1)'*A(:,k);     % orthogonal projection coefficients
  ek = A(:,k) - Q(:,1:k1-1)*r; % orthogonal direction vector
  norme = norm(ek);
  if(norme)         % if nonzero norm, include this
    R(1:k1,k1) = [r;norme];
    Q = [Q ek/R(k1,k1)];
    k1 = k1+1;
  end
end