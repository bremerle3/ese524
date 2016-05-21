function [A,normlist] = tohanktoep(A,r)
% 
% Determine the matrix nearest to A which is the stack
%  [ Hankel
%    Toeplitz ] 
% with rank r using the composite mapping algorithm
%
% function A = tohantoep(A,r)
%
% A = input matrix
% r = desired rank
%
% output: A = matrix with desired properties
% normlist = (optional) vector of errors

% Copyright 1999 by Todd K. Moon

[m,n] = size(A);   m=m/2;               % size of each block
if(r > min(m,n))
  error('Cannot satisfy rank requirement');
end

np = m+n-1;
% Build the linear structure matrix S and its pseudoinverse operator
i1 = eye(m);
S1 = [];    % structure matrix for Hankel
S2 = [];    % structure matrix for Toeplitz
S = [];     % the stack  
for i=1:n
  S1 = [zeros(m,i-1) i1 zeros(m,np-m-i+1)];
  S2 = [zeros(m,n-i) i1 zeros(m,i-1)];
  S = [S;S1;S2];
end

normlist = [];
numiter = 0;
maxiter = 200;
v = zeros(np,1);                       % vector of parameters
while(numiter < maxiter)
  numiter = numiter+1
  oldA = A;
  a = A(:);                            % vectorize
  for i=1:np                           % enforce the Hankel/Toeplitz property
  % average over corresponding elt's of X
  v(i) = sum(a(logical(S(:,i))))/sum(S(:,i)); 
  end
  A = reshape(S*v,2*m,n);
  [ua,sa,va] = svd(A);                 % enforce the rank property
  A = zeros(size(A));
  for i=1:r
    A = A+ sa(i,i)*ua(:,i)*va(:,i)';
  end
  norm(A-oldA) 
  if (nargout == 2)
    normlist(numiter) = norm(A-oldA);
  end
  if(norm(A-oldA) < 1)
    break;
  end
  oldA = A;
end
if(numiter == maxiter)
  error('composite mapping algorithm did not converge');
end