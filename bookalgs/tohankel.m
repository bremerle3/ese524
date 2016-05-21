function [A,d] = tohankel(A,r)
% 
% Determine the matrix nearest to A which is Hankel and has rank r
% using the composite mapping algorithm
%
% function A = tohankel(A,r)
%
% A = input/output matrix
% r = desired rank
%
% Ouptut A = Hankel matrix with desired properties
% d = norm of difference between matrices

% Copyright 1999 by Todd K. Moon

[m,n] = size(A);
if(r > min(m,n))
  error('Cannot satisfy rank requirement');
end
np = m+n-1;
% Build the linear structure matrix S and its pseudoinverse operator
i1 = eye(m);
S = [];
for i=1:n
  S = [S; [zeros(m,i-1) i1 zeros(m,np-m-i+1)] ];
end
S

numiter = 0;  maxiter = 200;
if(nargout == 2)
  saveA = A;
end
v = zeros(np,1);                      % vector of parameters
while(numiter < maxiter)
  numiter = numiter+1;
  oldA = A;
  a = A(:);                           % vectorize
  for i=1:np                          % enforce the Hankel property
    v(i) = sum(a(logical(S(:,i))))/sum(S(:,i));% average over corresponding elt's of X
  end
  A = reshape(S*v,m,n);               % from v find A
  [ua,sa,va] = svd(A);                % enforce the rank property
  A = zeros(size(A));
  for i=1:r
    A = A+ sa(i,i)*ua(:,i)*va(:,i)';
  end
  if(norm(A-oldA) < 1.e-8)
    break;
  end
  oldA = A;
end
if(nargout == 2)
  d = norm(saveA - A);
end