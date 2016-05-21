% Plot the Gaussian function
% Copyright 1999 by Todd K. Moon

clf

subplot(3,3,1)
x = -4:.2:4;
sigma = 1;
mu = 0;
fx = 1/sqrt(2*pi*sigma)*exp(-1/(2*sigma^2)*(x-mu).^2);
plot(x,fx)
xlabel('w')
ylabel('f_w(w)')
axis([-4 4 0 .5])
set(gca,'XTick',[-4 -2 0 2 4])
set(gca,'YTick',[0 .1 .2 .3 .4])
print -dps ../pictures/plotgauss.ps
print -deps ../pictures/plotgauss.eps
