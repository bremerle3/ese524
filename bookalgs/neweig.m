function [T,Q] = neweig(A)
% 
% Compute the eigenvalues and eigenvector of a real symmetric matrix A
%
% function [T,Q] = neweig(A)
%
% A = matrix whose eigendecomposition is sought
%
% T = diagonal matrix of eigenvalues
% Q = (optional) matrix of eigenvectors

% Copyright 1999 by Todd K. Moon

epsilon=1e-13;       % a small number
[m,n] = size(A);
if(nargout==1)       % no eigenvectors needed
  T = tridiag(A);
else                 % save eigenvector information
  [T,Q] = tridiag(A);
end
q = 1;
while(q < n)
  for i=1:m-1
    % set off-diagonals to zero if they are small enough
    if(abs(T(i+1,i)) <= epsilon*(abs(T(i,i))+abs(T(i+1,i+1))))
      T(i+1,i) = 0;  T(i,i+1) = 0;
    end
  end
  % find lower right diagonal submatrix
  nd = 0;
  for j=m-1:-1:1
    if(T(j+1,j) ~= 0) nd = 1; break; end;
  end
  if(nd) q = m-j-1; else q = m; end;
  % find upper left diagonal submatrix
  for k=1:j  
    if(T(k+1,k) ~= 0) break; end;
  end
  p = k;  mq = m-q;
  % do the QR shift on the matrix in the middle
  if(q<m)
    if(nargout==1)
      T(p:mq,p:mq) = eigqrshiftstep(T(p:mq,p:mq));
    else
      [T(p:mq,p:mq),Q(:,p:mq)] =eigqrshiftstep(T(p:mq,p:mq),Q(:,p:mq));
    end 
  end
end