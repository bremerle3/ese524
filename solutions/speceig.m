% Set up a matrix with specified eigenvalue strucure
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

A1 = l1*P1 + l3*P2;

l1 = 1
l2 = 4
l3 = 9
x1 = [1 2 3]';
x2 = [-2 1 0]';
x3 = [-3 -6 5]';
A2 = [x1 x2 x3]
Q = gramschmidt1(A)

x1= x1/norm(x1); x2 = x2/norm(x2);  x3=x3/norm(x3);
P1 = x1*x1' + x2*x2';
P2 = x3*x3';
