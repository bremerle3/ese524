% Construct a matrix with given eigenspace structure
% Copyright 1999 by Todd K. Moon

l1 = 1
l2 = 1
l3 = 2
x1 = [1 2 1]';
x2 = [-2 1 0]';
x3 = [-1 -2 5]';

x1= x1/norm(x1); x2 = x2/norm(x2);  x3=x3/norm(x3);
P1 = x1*x1' + x2*x2';
P2 = x3*x3';

A = l1*P1 + l3*P2;
