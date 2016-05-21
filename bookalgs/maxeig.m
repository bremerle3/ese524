function [lambda,x] = maxeig(A)
%
% Compute the largest eigenvalue and associated eigenvector of 
% a matrix A using the power method
%
% function [lambda,x] = maxeig(A)
%
% A = matrix whose eigenvalue is sought
%
% lambda = largest eigenvalue
% x = corresponding eigenvector

% Copyright 1999 by Todd K. Moon

[n,n] = size(A);
x = zeros(n,1);
x(1) = 1;  % assumed to be not orthogonal to the first eigenvector
lambda = 1;
lambdaold = 0;
while(abs(lambda -lambdaold) > eps)
  lambdaold = lambda; 
  z = A*x;
  x = z/norm(z);
  lambda = x'*A*x;
end