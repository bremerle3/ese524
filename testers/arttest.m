% test the ART algorithm

% Copyright 1999 by Todd K. Moon

A = [1 2 3;
     -4 -2 -5;
     2 7 10;
     4 3 -2];
xtrue = [1;2;3];
b = A*xtrue;

lastx = [1;1;1];
e = [];
for i=1:10
  x = art1(A,lastx,b);
  e = [e norm(b - A*x)];
  lastx = x;
end

subplot(2,2,1);
plot(e);
xlabel('iteration number')
ylabel('||b - A x[k]||')
% print -dps ../pictures/art1.ps
% print -deps ../pictures/art1.eps
