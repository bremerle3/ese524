% plot a quadratice error surface
% Copyright 1999 by Todd K. Moon

mx = 0; my = 0;
sx2 = .1; sy2=.1;
sx = sqrt(sx2);  sy = sqrt(sy2);
rho = -.1;

[X,Y] = meshgrid([-2:.2:2]);
fxy = ((X -mx).^2/sx2 + (Y-my).^2/sy2 - 2*rho*(X-mx).*(Y-my)/(sx*sy));
clf
subplot(2,2,1);
%mesh(X,Y,fxy); %,gradient(fxy))
surf(X,Y,fxy+10,real(gradient(fxy)))
hold on
contour(X,Y,fxy,10);
% set(gca,'ZTick',[])
% axis([-2 2 -2 2 0 40])
xlabel('c_1')
ylabel('c_2')
zlabel('J(c)')

print -deps ../pictures/quaderr.eps

