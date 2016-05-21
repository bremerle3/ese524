% Plot the Bessel function
% Copyright 1999 by Todd K. Moon

x=0:.1:5;
subplot(2,2,1);
plot(x,besseli(0,x));
xlabel('x')
ylabel('I_0(x)')
axis([0 5 0 30])
set(gca,'XTick',[0,1,2,3,4,5])
set(gca,'YTick',[0,5,10,15,20,25,30])
axis square
print -dps ../pictures/plotI0.ps
print -deps ../pictures/plotI0.eps
