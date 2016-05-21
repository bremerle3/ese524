function x = art1(A,x,b)
% 
% Produce an updated solution x to Ax = b using the algebraic reconstruction
% technique.
% (This function is for demonstration, and does not precompute
% row norms as a more efficient version would.)  No constraints are applied.
%
% function x = art1(A,x,b)
%
% A = input matrix
% x = initial solution
% b = right-hand side
% 
% Output x= updated solution

% Copyright 1999 by Todd K. Moon


[m,n] = size(A);
for i=1:m
  x = x + (b(i) - A(i,:)*x)/(A(i,:)*A(i,:)') * A(i,:)';
end