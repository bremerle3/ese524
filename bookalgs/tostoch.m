function A = tostoch(A)
% 
% Determine the matrix nearest to A which is stochastic using
% the composite mapping algorithm
%
% function A = tostoch(A)
% A = input matrix
%
% Output: A = nearest stochastic A

% Copyright 1999 by Todd K. Moon

[m,n] = size(A);   numiter = 0;
while(numiter < 200)
  numiter = numiter+1;
  oldA = A; 
  for i=1:m               % apply the row-sum mapping to each row
  A(i,:) = A(i,:) + (1 - sum(A(i,:)))/n;
  end
  idx = A < 0;            % apply the positive mapping to each row
  A(idx) = zeros(size(A(idx)));
  if(norm(A - oldA) < 1.e-8)
  break;
  end
end