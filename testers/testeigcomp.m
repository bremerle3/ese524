% Test the eigencomputation routine
% Copyright 1999 by Todd K. Moon

l1 = 1; l2 = 2; l3 = 3; l4 = 4;
x1 = [1 2 3 4]'; x2 = [1 4 -2 1]'; x3 = [1 1 1 1]'; x4 = [1 1 1 -1]';
A = [x1 x2 x3 x4];
[Q,R] = gramschmidt1(A);
x1 = Q(:,1);  x2=Q(:,2);  x3=Q(:,3);  x4=Q(:,4);
% x1 = x1/norm(x1);  x2 = x2/norm(x2);  x3 = x3/norm(x3);  x4 = x4/norm(x4);
A = l1*x1*x1' + l2*x2*x2' + l3*x3*x3' + l4*x4*x4'
[T,X] = neweig(A)
