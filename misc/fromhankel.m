function x = fromhankel(X,d)
%
% Pull sequential data out of a Hankel matrix X 
%
% X = Hankel matrix
% d = (optional) dimension of data
%
% x = Sequential data

% Copyright 1999 by Todd K. Moon

if(nargin == 1)
  d = 1;
end
[m,n] = size(X);
x = X(:,1)
t = X(m-d+1:m,2:n);
x =  [x;t(:)];
