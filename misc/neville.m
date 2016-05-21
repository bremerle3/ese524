function y = neville(x, X, Y)
% 
% Neville's algorithm for computing a value for an interpolating polynomial
% y = NEVILLE(x,X,Y) takes the (xi,yi) coordinate pairs in the
% vectors X and Y and computes the value of the unique
% interpolating polynomial that passes through the list of points
% at the given value of x. 
% 
% function y = neville(x, X, Y)
%
% x = interpolated point
% X = X data
% Y = Y data
%
% y = interpolated value

% Copyright 1999 by Todd K. Moon

if length(X) ~= length(Y)
  error('Point lists were not of equal length in NEVILLE');
end
[m,n] = size(X);
X = X(:);  Y = Y(:);   % make into columns
% if the x coordinate is already one of the X axis coordinates then just
% return the coordinate in the Y vector that matches it.
[check,ind] = min(abs(X-x));
if check < sqrt(eps)
  y = Y(ind);
else
  A = Y;   n = length(Y);
  for i = 2:n
    A = ((X(i:n)-x).*A(1:n-i+1) + (x-X(1:n+1-i)).*A(2:n-i+2)) ...
        ./(X(i:n)-X(1:n-i+1));
  end
end
y = A;