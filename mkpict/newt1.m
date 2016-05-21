% Demonstrate newton's stuff
% Copyright 1999 by Todd K. Moon

t = -10:.05:10;
subplot(2,2,1);
plot(t,t.*sin(t) - cos(t));
hold on;
plot([-10 10],[0 0],':')
set(gca,'XTick',[-9,-6, -3,0,3,6,9])
x = 2.3;
xs(1) = x;
f = x* sin(x) - cos(x);
ys(1) = f;
for i=2:10
  f = x* sin(x) - cos(x);
  df = x*cos(x) + 2* sin(x);
  x = x - f/df;
  xs(i) = x;
  ys(i) = f;
end
print -dps ../pictures/newt1.ps
print -deps ../pictures/newt1.eps
