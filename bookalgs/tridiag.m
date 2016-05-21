function [T,Q] = tridiag(A)
% 
% tridiagonalize the real symmetric matrix A
% 
% function [T,Q] = tridiag(A)
%
% A = matrix whose tridiagonal form is sought
%
% T = tridiagonal matrix
% Q = (optional) orthogonal transformation

% Copyright 1999 by Todd K. Moon

[m,n] = size(A);
V = [];
for k=1:m-2      % for each of the columns/rows to zero out
  v = makehouse(A(k+1:end,k));
  if(nargout==2), V(k+1:m,k) = v; end;
  A(k+1:end,k:m) = houseleft(A(k+1:end,k:m),v);
  A(k:m,k+1:end) = houseright(A(k:m,k+1:end),v);
end
T = A;
if(nargout==2), Q = qrmakeq(V); end;