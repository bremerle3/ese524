% find a discrete approximating polynomial
% Copyright 1999 by Todd K. Moon

n = (1:7)';
x = sin(n*pi/7);
clf;
subplot(2,2,1);
stem(n,x)
xlabel('k')
ylabel('x[k]')
axis([0,7 -.5 1]);
print -dps ../pictures/discapprox1.ps
print -deps ../pictures/discapprox1.eps

m = 3;
mlist = 0:m-1;
P = [];
for i=n'
  P = [P;i.^mlist];
end
c = P\x;
p = P*c;

clf
subplot(2,2,1);
err = x-p;
stem(n,err);
axis([0,7 -.05 .05]);
xlabel('k')
ylabel('e[k] = x[k] - p[k]')
print -dps ../pictures/discapprox2.ps
print -deps ../pictures/discapprox2.eps