% plot a function and a linear approximating surface
% Copyright 1999 by Todd K. Moon

[X,Y] = meshgrid([0:.2:5]);
fxy = (X .* exp(-X)) .* (Y .* exp(-Y));

x = 1.2;
y = 1.2;

gx = (-x*exp(-x) + exp(-x))*(y*exp(-y));
gy = (x*exp(-x))*(-y*exp(-y) + exp(-y));
g = [gx;gy];
fx0 = (x * exp(-x)) * (y * exp(-y));

plane = fx0 + gx.*(X-x) + gy.*(Y-y);

clf
%subplot(2,2,1);
surf(X,Y,fxy); %,gradient(fxy))
hold on
surf(X,Y,plane, gradient(plane));
hold on
%$$$ contour(X,Y,fxy,10);
%$$$ set(gca,'ZTick',[])
%$$$ axis([-2 2 -2 2 0 40])
%$$$ 
%$$$ print -deps ../pictures/gauss21.ps
%$$$ j = input('press enter')
%$$$ 
%$$$ rho = 0;
%$$$ fxy2 = 1/(2*pi*sx*sy*sqrt(1-rho^2))*...
%$$$ 	    exp(-2/(1-rho^2)*((X -mx).^2/sx2 + (Y-my).^2/sy2 - ...
%$$$ 		2*rho*(X-mx).*(Y-my)/(sx*sy)));
%$$$ clf
%$$$ subplot(2,2,1);
%$$$ surf(X,Y,100*fxy2+20)
%$$$ hold on 
%$$$ contour(X,Y,fxy2);
%$$$ set(gca,'ZTick',[])
%$$$ axis([-2 2 -2 2 0 40])
%$$$ print -deps ../pictures/gauss22.ps

