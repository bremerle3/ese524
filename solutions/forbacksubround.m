function [x] = forbacksubround(b,LUin,indx,digits)
% 
% Solve Ax = b, where A has been factored as PA = LU
% using digits places after the decimal point.
%
% function [x] = forbacksubround(b,LUin,indx,digits)
%
% b = right hand side
% LUin = LUfactorization (from newlu)
% indx = pivot index list (from newlu)
% digits = number of digits to retain
%
% x = solution

% Copyright 1999 by Todd K. Moon

n = length(indx);
% Step 1: solve Ly = Pb
y(1) = b(indx(1)); 
for k=2:n
  y(k) = rdigits(b(indx(k)) - LUin(k,1:k-1)*y(1:k-1)',digits);
end

% step 2: solve Ux = y
x(n) = y(n)/LUin(n,n);
for j=n-1:-1:1
  x(j) = rdigits(1/LUin(j,j)*(y(j) - LUin(j,j+1:n)*x(j+1:n)'),digits);
end
x = x(:);
