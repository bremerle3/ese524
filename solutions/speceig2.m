% Construct a matrix with given eigenspace structure
% Copyright 1999 by Todd K. Moon

l1 = 1
l2 = 4
l3 = 9
x1 = [1 2 3]';
x2 = [-2 1 0]';
x3 = [-3 -6 5]';

x1= x1/norm(x1); x2 = x2/norm(x2);  x3=x3/norm(x3);
P1 = x1*x1';
P2 = x2*x2';
P3 = x3*x3';
A = l1*P1 + l2*P2 + l3*P3;
