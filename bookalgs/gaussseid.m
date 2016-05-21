function x = gausseid(A,x,b)
% 
% Produce an updated solution x to Ax = b using Gauss-Seidel iteration
%
% function x = gausseid(A,x,b)
%
% A = input matrix
% x = initial solution
% b = right-hand side
% 
% Output x= updated solution

% Copyright 1999 by Todd K. Moon


[m,n] = size(A);
for i=1:n
  xn = 0;
  for j = 1:i-1
    xn = xn + A(i,j)*x(j);
  end
  for j = i+1:n
    xn = xn + A(i,j)*x(j);
  end
  xn = (b(i) - xn)/A(i,i);
  x(i) = xn;
end