% make the contour plot for wftest
% Copyright 1999 by Todd K. Moon

h0 = [-1:.1:1];
h1 = [-1:.1:1];
r0 = Rff(1,1);
r1 = Rff(1,2);
[H0,H1] = meshgrid(h0,h1);
J = sigmad2 - 2*(H0*p0 + H1*p1) + (r0*H0.*H0 + 2*r1*H0.*H1 + r0*H1.*H1);
clf;
subplot(2,2,1);
[C,hC] = contour(h0,h1,J,10);
axis square
Cnew = round(C*100+.49)/100;
clabel(Cnew,hC);
xlabel('h[0]');    ylabel('h[1]');
hold on
plot(h(1),h(2),'o');
l = sprintf('%.2g',e2min)
text(h(1)+.052,h(2),l);
print -dps ../pictures/wftestcont.ps
print -deps ../pictures/wftestcont.eps
