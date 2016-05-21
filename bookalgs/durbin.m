function [x] = durbin(r)
% 
% solve the nxn Toeplitz system Tx = [r(1)..r(n)]
% given a vector r = (r_0,r_1,\ldots,r_{n+1}),
%
% Since matlab has no zero-based indexing, r(1) = r_0
%
% function [x] = durbin(r)
%
% r = input vector
% x = solution to Tx = r

% Copyright 1999 by Todd K. Moon

n = length(r)-1
x = r(2)/r(1);  alpha = x(1,1);  beta = r(1);
for k=1:n-1
  beta = (1-alpha*conj(alpha))*beta;
  alpha = (r(k+2) - r(k+1:-1:2).'*x)/beta;
  for i=1:k
    z(i,1) = x(i) - alpha*conj(x(k+1-i,1));
  end
  x(1:k,1) = z(1:k,1);    x(k+1,1) = alpha;
end