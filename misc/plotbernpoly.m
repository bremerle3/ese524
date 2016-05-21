% plot the Benstein polynomial
% Copyright 1999 by Todd K. Moon

t = 0:0.01:1;
b0 = bernpoly(3,0,t);
b1 = bernpoly(3,1,t);
b2 = bernpoly(3,2,t);
b3 = bernpoly(3,3,t);

subplot(2,2,1);
plot(t,b0,'-',t,b1,':',t,b2,'--',t,b3,'-.')
legend('j=0','j=1','j=2','j=3')
xlabel('t')
ylabel('p_{n,j}(t)')

% print -dps ../pictures/bernpoly.ps
