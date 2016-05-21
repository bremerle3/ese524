function [R,thetac,thetas] = qrgivens(A)
% 
% Compute the QR factorization of a matrix A without column pivoting
% using Givens rotations
%
% function [R,thetac,thetas] = qrgivens(A)
% 
% A = mxn matrix (assumed to have full column rank)
%
% R = upper triangular matrix
% thetac = matrix of c values 
% thetas = matrix of s values (these must be converted to Q)

% Copyright 1999 by Todd K. Moon

[m,n] = size(A);
for k=1:n                 % for each column
  for i=m:-1:k+1          % for the rows in the column to zero
    [c,s] = qrtheta(A(i-1,k),A(i,k));  % find the angle, then rotate
    % apply the givens rotation to rows (i-1) and i of A, zeroing A(i,k):
    A(i-1:i,k:n) = [c*A(i-1,k:n) - s*A(i,k:n); s*A(i-1,k:n) + c*A(i,k:n)];
    % store the cos and sin values:
    thetac(i,k) = c;  thetas(i,k) = s;
  end   
end
R = A;