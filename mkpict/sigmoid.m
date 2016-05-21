% plot the sigmoid function
% Copyright 1999 by Todd K. Moon

x = -10:.1:10;
y = 1 ./ (1 + exp(-x));
subplot(3,3,1);
plot(x,y);
xlabel('v')
ylabel('\phi(v)')
print -dps ../pictures/sigmoid.ps
print -deps ../pictures/sigmoid.eps
