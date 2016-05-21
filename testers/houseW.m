% test the weighted Householder idea
% Copyright 1999 by Todd K. Moon

L = [1 0 0; 2 3 0; 1 2 5];
W = L*L';

x = [1;2;3];
alpha = sqrt(x'*W*x);   % norm square of x
v = x - alpha*[1;0;0];
Pv = v*v'*W/(v'*W*v)
Hv = eye(3) - 2*v*v'*W/(v'*W*v);
xnew = Hv*x

xnew'*W*xnew
x'*W*x