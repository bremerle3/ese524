function [L] = cholesky(B)
%
% Compute the Cholesky factorization of B, B = LL'
% (this version does not require additional storage)
%
% function [L] = cholesky(B)
%
% B = matrix to be factored
%
% L = lower triangular factor

% Copyright 1999 by Todd K. Moon

[m,m] = size(B);
for k=1:m
  if(B(k,k) < 0)
    error('Matrix should be positive definite');
  end
  B(k,k) = sqrt(B(k,k));
  B(k+1:m,k) = B(k+1:m,k)/B(k,k);
  for j=k+1:m
    B(j:m,j) = B(j:m,j) - B(j:m,k)*B(j,k);
  end
  B(k,k+1:m) = zeros(1,m-k);
end
L = B;