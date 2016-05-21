% make the contour plot for wftest
% Copyright 1999 by Todd K. Moon

x1 = [2:.1:5];
x2 = [-3:.1:2];
[X1,X2] = meshgrid(x1,x2);
J = 3*X1.*X1 + 2*X1.* X2 + 3*X2.*X2 - 20 *X1 + 4*X2;
clf
subplot(2,2,1);
[C,hC] = contour(x1,x2,J,10);
axis square
Cnew = round(C*100+.49)/100;
clabel(Cnew,hC);
xlabel('x_1');    ylabel('x_2');
hold on 
plot([2 5],[0 0],':')
plot(10/3,0,'x')
plot(4,-2,'o')
print -dps ../pictures/min1.ps
print -deps ../pictures/min1.eps
