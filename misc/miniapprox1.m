% minimax approximation example
% Copyright 1999 by Todd K. Moon

t = 0:.05:1
subplot(2,2,1);
b = 1.2;
b1 = .1;
m = (b1-b)
%m = -.73
hold on;
plot(t,cos(pi*t/2),t,m*t + b);

subplot(2,2,2);
plot(t,cos(pi*t/2) - (m*t+b))
axis([0 1 -.2 .2]);

m = -1;
b = 1.1053;
zeta = .4393;
delta = .1053;
subplot(2,2,3);
plot(t,cos(pi*t/2),t,m*t + b);
subplot(2,2,4);
plot(t,cos(pi*t/2) - (m*t+b));
axis([0 1 -.2 .2]);
