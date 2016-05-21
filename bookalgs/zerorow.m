function [B,U] = zerorow(B,f,U)
% 
% Zero a row by a series of Givens rotations
%
% function [B,U] = zerorow(B,f,U)
%
% B = matrix to have row zeroed
% f = vector of row indices that are zero on the diagonal
% U = (optional) rotation matrix
%
% B = modified matrix
% U = (optional) rotation matrix

% Copyright 1999 by Todd K. Moon

[n,n] = size(B);
if(nargout==2)  % keep track of the rotation
  if(nargin==2) U = eye(n); end
end
% if any diagonal element of B is zero, zero the superdiagonal entry
lasti = 0;
while(any(f>lasti))
  t = f(f>lasti);  i = t(1);
  if(i < n)
    for j=i+1:n
      x = B(j,j), y = B(i,j)
      [c,s] = qrtheta(x,y);
      B([j,i],:) = [c*B(j,:) - s*B(i,:); s*B(j,:) + c*B(i,:)];
      if(nargout==2)       % keep track of the rotation
        U(:,[j,i]) = [c*U(:,j)-s*U(:,i),s*U(:,j)+c*U(:,i)];
      end
    end
  end
  lasti = i;
  f = find(diag(B)==0);
end