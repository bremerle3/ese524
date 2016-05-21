function [x] = forbacksub(b,LUin,indx)
% 
% Solve Ax = b, where A has been factored as PA = LU
%
% function [x] = forbacksub(b,LUin,indx)
 
% Copyright 1999 by Todd K. Moon

n = length(indx);

% Step 1: solve Ly = Pb
y(1) = b(indx(1)); 
for k=2:n
  y(k) = b(indx(k)) - LUin(k,1:k-1)*y(1:k-1)';
end

% step 2: solve Ux = y
x(n) = y(n)/LUin(n,n);
for j=n-1:-1:1
  x(j) = 1/LUin(j,j)*(y(j) - LUin(j,j+1:n)*x(j+1:n)');
end
x = x(:);
