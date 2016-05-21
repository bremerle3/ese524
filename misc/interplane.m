function x = interplane(m1,x1,m2,x2)
% 
% find the intersecting point for the planes
%  m1'(x-x1) = 0   and  m2'(x-x2)=0.
%
% function x = interplane(m1,x1,m2,x2)
%
% m1 = normal to plane
% x1 = point on plane
% m2 = normal to plane
% x2 = point on plane
%
% x = intersecting point

% Copyright 1999 by Todd K. Moon

A = [m1';m2'];
b = [m1'*x1; m2'*x2];
x = A\b;