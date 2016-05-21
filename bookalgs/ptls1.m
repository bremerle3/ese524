function [x,Ahat,bhat] = ptls1(A,b,k)
% 
% Compute the Partial Total Least Squares solution of Ax = b
% where the first k columns of A are not modified
%
% function [x,Ahat,bhat] = ptls1(A,b,k)
%
% A = system matrix
% b = right-hand side
% k = number of columns of A not modified
%
% x = ptls solution to Ax=b
% Ahat = modified A matrix
% bhat = modified b matrix

% Copyright 1999 by Todd K. Moon

[m,n] = size(A); 
X = [A -b];
X1 = X(:,1:k)
l = rank(X1)
X2 = X(:,k+1:end)
lx = rank(X);
[qx,rx] = qr(X);
q1 = qx(:,1:k); q2 = qx(:,k+1:lx); q3 = qx(:,lx+1:end);
R11 = rx(1:k,1:k); R12 = rx(1:k,k+1:end); R22 = rx(k+1:lx,k+1:end);
r = n;
if(l <= r)
  [u,s,v] = svd(R22);
  d = r-l
  s(d+1:end,d+1:end) = 0;
  Hp = u*s*v';
  X2hat = q1*R12 + q2*Hp;
  Xhat = [X1 X2hat];
else
  error('Cannot satisfy rank requirements\n');
end
Ahat = Xhat(:,1:n);
bhat = -Xhat(:,n+1:end)
x = pinv(Ahat)*bhat;