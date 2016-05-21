function [L,U] = getulu(luin,indx)
% 
% Return the L and U matrix from the LU factorization computed by newlu
%
% function [L,U] = getulu(luin,indx)
%
% luin = lu matrix from newlu
% index = pivot index from newlu
%
% L = lower triangle
% U = upper triangle

% Copyright 1999 by Todd K. Moon

[n,n] = size(luin);
L = eye(n);
% copy over the lower triangle
for j=1:n-1
  L(j+1:end,j) = luin(j+1:end,j);
end

L = L(indx,:)

% Pick out the upper triangle
U = zeros(n,n);
for j=1:n
  U(j,j:n) = luin(j,j:n);
end