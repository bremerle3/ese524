function [B,U,V] = bidiag(A)
% 
% bidiagonalize the real symmetric matrix A: UAV' = B,
% 
% function [B,U,V] = bidiag(A)
%
% A = matrix to be factored
%
% B = bidiagonal
% U = orthogonal transformation (optional output)
% V = orthogonal transformation (optional output)

% Copyright 1999 by Todd K. Moon

[m,n] = size(A);
U = [];  V = [];
for j=1:n
  u = makehouse(A(j:end,j));
  if(nargout>1), U(j:m,j) = u; end;
  A(j:end,j:end) = houseleft(A(j:end,j:end),u);
  if(j <= n-2)
    v = makehouse(A(j,j+1:n));
    if(nargout > 1), V(j+1:n,j) = v; end;
    A(j:end,j+1:end) = houseright(A(j:end,j+1:end),v);
  end
end
B = A;
if(nargout>1), U = qrmakeq(U); V = qrmakeq(V);  end;
f = find(diag(B)<0);
B(f,:) = -B(f,:);  U(:,f) = -U(:,f);