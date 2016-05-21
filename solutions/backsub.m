function x = backsub(U,b)
% 
% solve Ux = b, where U is upper triangular
%
% function x = backsub(U,b)
% U = upper triangular matrix
% b = right and side
%
% x = solution

% Copyright 1999 by Todd K. Moon

[n,m] = size(U);  if(n ~= m) error('Error: matrix needs to be square'); end;
if(U(n,n) == 0) error('singular matrix'); end;
x = zeros(n,1);
x(n) = b(n)/U(n,n);
for k=n-1:-1:1
  if(U(k,k) == 0) error('singular matrix'); end;
  x(k) = (b(k) - U(k,k+1:end)*x(k+1:end))/U(k,k);
end
