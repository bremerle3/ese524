% Make side-by-side figures
% Copyright 1999 by Todd K. Moon

figure(1);
subplot(2,2,1);
lambda = 2.5;
x0 = 0.15;
ifs3a;
axis([0 1 0 1]);
% xlabel('(a)');
axis square
print -dps ../pictures/logistic1a.ps
print -deps ../pictures/logistic1a.eps
input('press return')

%subplot(2,2,2);
lambda = 1.5;
x0 = 0.8;
ifs3b;
axis([0 1 0 1]);
%xlabel('(b)');
axis square
print -dps ../pictures/logistic1b.ps
print -deps ../pictures/logistic1b.eps
input('press return')

%figure(2);
%subplot(2,2,3);
lambda = 3.2;
x0 = 0.21;
ifs3b;
axis([0 1 0 1]);
%xlabel('(c)');
axis square
print -dps ../pictures/logistic1c.ps
print -deps ../pictures/logistic1c.eps
input('press return')

%subplot(2,2,4);
lambda = 3.9;
x0 = 0.21;
ifs3b;
axis([0 1 0 1]);
%xlabel('(d)');
axis square
print -dps ../pictures/logistic1d.ps
print -deps ../pictures/logistic1d.eps
