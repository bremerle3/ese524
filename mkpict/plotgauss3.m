% plot a Gauss surface plot
% Copyright 1999 by Todd K. Moon

mx = 0; my = 0;
sx2 = 1; sy2=1;
sx = sqrt(sx2);  sy = sqrt(sy2);
rho = .9;

 [X,Y] = meshgrid([-2:.1:2]);
fxy = 1/(2*pi*sx*sy*sqrt(1-rho^2))*...
	    exp(-2/(1-rho^2)*((X -mx).^2/sx2 + (Y-my).^2/sy2 - ...
		2*rho*(X-mx).*(Y-my)/(sx*sy)));
clf
subplot(2,2,1);
surf(X,Y,100*fxy+20); %,gradient(fxy))
hold on
contour(X,Y,fxy,10);
set(gca,'ZTick',[])
axis([-2 2 -2 2 0 40])

print -dps ../pictures/gauss21.ps
print -deps ../pictures/gauss21.eps
j = input('press enter')

rho = 0;
fxy2 = 1/(2*pi*sx*sy*sqrt(1-rho^2))*...
	    exp(-2/(1-rho^2)*((X -mx).^2/sx2 + (Y-my).^2/sy2 - ...
		2*rho*(X-mx).*(Y-my)/(sx*sy)));
clf
subplot(2,2,1);
surf(X,Y,100*fxy2+20)
hold on 
contour(X,Y,fxy2);
set(gca,'ZTick',[])
axis([-2 2 -2 2 0 40])
print -dps ../pictures/gauss22.ps
print -deps ../pictures/gauss22.eps

