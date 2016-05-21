% plot the Benstein polynomial approximation to $f(t) = e^t$
% Copyright 1999 by Todd K. Moon

t = 0:0.01:1;
n=3;
b0 = bernpoly(n,0,t);
b1 = bernpoly(n,1,t);
b2 = bernpoly(n,2,t);
b3 = bernpoly(n,3,t);

j = 0:n;
f = exp(t);
fj = exp(j/n);
pn = fj(1)*b0 + fj(2)*b1 + fj(3)*b2 + fj(4)*b3;
clf
subplot(2,2,1);
plot(t,f,t,pn,'--',j/n,exp(j/n),'o')

% print -dps ../pictures/bernpolyapp.ps
