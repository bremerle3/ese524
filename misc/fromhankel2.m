function y = fromhankel2(X,d)
% Pull sequential data out of a Hankel matrix X  (cell array version)
%
% X = Hankel matrix
% d = (optional) dimension of data
%
% x = Sequential data (in a cell array)

% Copyright 1999 by Todd K. Moon

if(nargin == 1)
  d = 1;
end
[m,n] = size(X);
x = X(:,1);
t = X(m-d+1:m,2:n);
x =  [x;t(:)];
l = length(x);
x = reshape(x,d,l/d);
for i=1:l/d
  y{i} = x(:,i);
end