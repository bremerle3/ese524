% test a Givens matrix
% Copyright 1999 by Todd K. Moon

A = [1 2; 3 4; 1 3];
i=3; k=1; j = i-1;
theta = -atan2(A(i,k),A(j,k))
c = cos(theta);  s = sin(theta);
G = eye(3);
G(j,j) = c;  G(i,i) = c;
G(j,i) = -s; G(i,j) = s;
G
A = G*A
i=2; k=1; j = i-1;
theta = -atan2(A(i,k),A(j,k))
c = cos(theta);  s = sin(theta);
G = eye(3);
G(j,j) = c;  G(i,i) = c;
G(j,i) = -s; G(i,j) = s;
G
A = G*A

i=3; k=2; j = i-1;
theta = -atan2(A(i,k),A(j,k))
c = cos(theta);  s = sin(theta);
G = eye(3);
G(j,j) = c;  G(i,i) = c;
G(j,i) = -s; G(i,j) = s;
G
A = G*A

