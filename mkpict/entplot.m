% plot the binary entropy function
% Copyright 1999 by Todd K. Moon

p=0:0.01:1
Hp = H(p);
subplot(3,3,1);
plot(p,Hp);
xlabel('p')
ylabel('H(p)')
print -dps ../pictures/entplot.ps
print -deps ../pictures/entplot.eps