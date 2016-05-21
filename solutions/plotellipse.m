function [x] = plotellipse(A,x0,c)
% 
% Determine the points to plot an ellispe in two dimensions, 
% described by (x-x0)'*A*(x-x0) = c, where A is symmetric
%
%  function [x] = plotellipse(A,x0,c)
%
% A = symmetric matrix describing ellipse
% x0 = center point
% c = constant
%
% x = 2 x n list of data points

% Copyright 1999 by Todd K. Moon

dtheta = 0.1;
[u,d] = eig(A);
x = [];
d = inv(sqrt(d));
for theta = 0:dtheta:2*pi
  w = sqrt(c)*[cos(theta); sin(theta)];
  z = d*w;
  x = [x u*z + x0];
end
x = [x x(:,1)];
  