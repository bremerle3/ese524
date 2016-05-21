function [y] = levinson(r,b)
% 
% Given a vector r = (r_0,r_1,\ldots,r_{n-1}),
% and a vector b = (b_1,b_2,\ldots,b_n)
% solve the nxn Toeplitz system Tx = b
%
% function [y] = levinson(r,b)
%
% Since Matlab has no zero-based indexing, r(1) = r_0
%
% r = vector of coefficients for Toeplitz matrix
% b = right-hand side
% 
% y = solution to Tx = b

% Copyrigth 1999 by Todd K. Moon

n = length(r);   x(1,1) = r(2)/r(1);   y(1,1) = b(1)/r(1);
alpha = x(1,1);
beta = r(1);
for k=1:n-1
  beta = (1-alpha*conj(alpha))*beta;
  mu = (b(k+1) - r(k+1:-1:2).'*y(1:k))/beta;
  v(1:k,1) = y(1:k,1) - mu*conj(x(k:-1:1));
  y(1:k,1) = v(1:k,1);  y(k+1,1) = mu;
  if(k < n-1)
    alpha = (r(k+2) - r(k+1:-1:2).'*x)/beta;
    z(1:k,1) = x(1:k) - alpha*conj(x(k:-1:1));
    x(1:k,1) = z(1:k,1); x(k+1,1) = alpha;
  end
end