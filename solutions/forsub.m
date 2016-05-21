function x = forsub(L,b)
% 
% Solve Lx = b, where L is lower triangular
% %
% function x = forsub(L,b)
%
% L = lower triangular matrix
% b = right-hand side
%
% x = solution

% Copyright 1999 by Todd K. Moon

[n,m] = size(L);  if(n ~= m) error('Error: matrix needs to be square'); end;
if(L(1,1) == 0) error('singular matrix'); end;
x = zeros(n,1);
x(1) = b(1)/L(1,1);
for k=2:n
  if(L(k,k) == 0) error('singular matrix'); end;
  x(k) = (b(k) - L(k,1:k-1)*x(1:k-1))/L(k,k);
end
