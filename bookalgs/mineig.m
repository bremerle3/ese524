function [lambda,x] = mineig(A)
% 
% Compute the smallest eigenvalue and associated eigenvector of 
% a matrix A using the power method
% function [lambda,x] = mineig(A)
%
% A = matrix whose eigenvalue is sought
%
% lambda = minimum eigenvalue
% x = corresponding eigenvector

% Copyright 1999 by Todd K. Moon

[lambda1,x] = maxeig(A);
B = lambda1*eye(size(A)) - A;
[mu,x] = maxeig(B);
lambda = lambda1-mu;