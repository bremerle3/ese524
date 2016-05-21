% make the contour plot for wftest
% Copyright 1999 by Todd K. Moon

x1 = [0:.05:1];
x2 = [0:.05:1];
[X1,X2] = meshgrid(x1,x2);
J = 10*(cos(2*pi*(X1))+1).^(1) .* (2*X2-.7).^(2)+10;
clf
subplot(2,2,1);
%plot3(X1,X2,J)
%axis square
mesh(X1,X2,J)
xlabel('x_1');    ylabel('x_2');
zlabel('f(x_1,x_2)');
print -dps ../pictures/min2.ps
print -deps ../pictures/min2.eps

clf
subplot(2,2,1)
%hold on
%subplot(2,2,2);
[C,hC] = contour(x1,x2,J,20);
%Cnew = round(C*100+.49)/100;
%clabel(Cnew,hC);
xlabel('x_1');    ylabel('x_2');
hold on 
%plot([2 5],[0 0],':')
% plot(.5,.7,'x')
%plot(4,-2,'o')
%print -dps ../pictures/min1.ps
%print -deps ../pictures/min1.eps
x1h = [0:.1:.8];
%x2h = (1.25*x1h+1)/2;
x2h = .6*x1h+.52;
set(gcf,'DefaultLineLineWidth',1)
plot(x1h,x2h)
set(gcf,'DefaultLineLineWidth',.5);
% [X1h,X2h] = meshgrid(x1h,x2h);
%Jh = 10*(cos(2*pi*(x1h))+1).^(1/2) .* (x2h-.7).^(2)+10;
%plot3(x1h,x2h,Jh);

x1g = .1; x2g = .6*x1g + .52;
p1 = -20*pi*sin(2*pi*x1g)*(2*x2g-.7)^2;
p2 = 40*(cos(2*pi*x1g)+1)*(2*x2g-.7);
myquiver(x1g,x2g,p1/150,p2/150);

x1g = .1888; x2g = .6*x1g + .52;
p1 = -20*pi*sin(2*pi*x1g)*(2*x2g-.7)^2;
p2 = 40*(cos(2*pi*x1g)+1)*(2*x2g-.7);
myquiver(x1g,x2g,p1/150,p2/150);

x1g = .4; x2g = .6*x1g + .52;
p1 = -20*pi*sin(2*pi*x1g)*(2*x2g-.7)^2;
p2 = 40*(cos(2*pi*x1g)+1)*(2*x2g-.7);
myquiver(x1g,x2g,p1/150,p2/150);
axis equal
axis([0 1 0 1])
print -dps ../pictures/min3.ps
print -deps ../pictures/min3.eps