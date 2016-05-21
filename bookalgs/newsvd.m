function [varargout] = newsvd(A)
% 
% Compute the singular value decomposition of the mxn matrix A, as A= u s v'.
% We assume here that m>n
% 
% [u,s,v] = newsvd(A)
% or
% s = newsvd(A)
%
% A = matrix to be factored
% 
% Output:
% s = singular values
% u,v = (optional) orthogonal matrices

% Copyright 1999 by Todd K. Moon

% assume m>n
epsilon=1e-15;               % a small number
[m,n] = size(A);
if(nargout==1)               % no vectors needed
  Bz = bidiag(A);
else                         % save vector information
  [Bz,U,V] = bidiag(A);      % U'*A*V = Bz
end
nB = norm(Bz,'fro');
B = Bz(1:n,1:n);
q = 0;
while(q < n)
  for i=1:n-1  % set off-diagonals to zero if they are small enough
    if(abs(B(i,i+1)) <= epsilon*(abs(B(i,i))+abs(B(i+1,i+1))))
      B(i,i+1) = 0;
    end
  end
  for i=1:n    % set diagonals to zero if they are small enough
    if(abs(B(i,i)) < epsilon*nB), B(i,i) = 0; end;
  end
  % find largest lower right diagonal submatrix
  q = n;
  for j=n-1:-1:1
    if(B(j,j+1) ~= 0) q=n-j-1; break; end;
  end
  % find middle non-diagonal submatrix
  p = 0;
  for k=n-q-1:-1:1
    if(B(k,k+1) == 0) p = k; break; end;
  end
  nq = n-q;
  if(q<n)
    B22 = B(p+1:nq,p+1:nq);
    if(nargout > 1) 
      U22 = U(:,p+1:nq); 
      V22 = V(:,p+1:nq);
    end
    % if any diagonal element is zero, then zero the row
    f = find(diag(B22) == 0);
    if(any(f))
      if(nargout==1)
        B22 = zerorow(B22,f);
      else
        [B22,U22] = zerorow(B22,f,U22);
      end
    else    % otherwise, apply the Golub-Kahan step
      if(nargout==1)
        B22 = golubkahanstep(B22);
      else
        [B22,U22,V22] = golubkahanstep(B22,U22,V22);
      end
    end
    % put the pieces back
    B(p+1:nq,p+1:nq) = B22;
    if(nargout>1)
      U(:,p+1:nq) = U22; V(:,p+1:nq) = V22;
    end
  end
end
if(nargout==1)
  varargout(1) = {B};
else
  varargout(1) = {U}; varargout(2) = {B}; varargout(3) = {V};
end