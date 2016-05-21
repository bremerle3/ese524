% example of Jordan forms
% Copyright 1999 by Todd K. Moon

A = [4 1 3; 0 4 1; 0 0 4];

B = [3 0 1; 0 3 0; 0 0 3];

a = [0 1; -.09 .6]

c = [2 0 2; 0 2 3; 0 0 2]


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