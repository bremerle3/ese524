% Plot approximations to the central limit theorem
% Copyright 1999 by Todd K. Moon


delta = .01;
x1 = -1:delta:1;
fx1 = 0.5*ones(size(x1));

xz1 = -4:delta:-1;
xz2 = 1:delta:4;
z1 = zeros(size(xz1));
z2 = zeros(size(xz2));
x = [xz1 x1 xz2];
subplot(4,4,1);
plot(x,[z1 fx1 z2]);
axis([-5 5 0 1])
%xlabel('x')
%ylabel('f_x(x)')
print -dps ../pictures/unif1.ps
print -deps ../pictures/unif1.eps

clf
fxz = delta*conv(fx1,fx1);
x2 = -2:delta:2;
xz1 = -4:delta:-2;
xz2 = 2:delta:4;
z1 = zeros(size(xz1));
z2 = zeros(size(xz2));
x = [xz1 x2 xz2];
subplot(4,4,1);
plot(x,[z1 fxz z2]);
%xlabel('z')
%ylabel('f_z(z)')
print -dps ../pictures/unif2.ps
print -deps ../pictures/unif2.eps

clf
fxy = delta*conv(fxz,fx1);
x3 = -3:delta:3;
xz1 = -4:delta:-3;
xz2 = 3:delta:4;
z1 = zeros(size(xz1));
z2 = zeros(size(xz2));
x = [xz1 x3 xz2];
subplot(4,4,1);
plot(x,[z1 fxy z2]);
%xlabel('y')
%ylabel('f_y(z)')
print -dps ../pictures/unif3.ps
print -deps ../pictures/unif3.eps





