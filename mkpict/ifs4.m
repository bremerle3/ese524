% Demonstrate the logistic map
% Copyright 1999 by Todd K. Moon

subplot(2,2,1)
t = 0:.02:1;
lambda = 3.2;
hold off
plot(t,logistic(logistic(t,lambda),lambda));
hold on
plot([0 min(lambda/3,1)],[0 min(lambda/3,1)],'-.');
axis square
print -dps ../pictures/logistic2.ps
print -deps ../pictures/logistic2.eps
