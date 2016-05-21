% test the procrustes rotation
% Copyright 1999 by Todd K. Moon

npts = 5;
x = -10*(rand(1,5)-.5);
y = -10*(rand(1,5)-.5);
clf;
subplot(2,2,1)
plot(x,y,'x')
hold on
line([0 x(1)],[0 y(1)])
axis equal
axis([-5 5 -5 5]);
theta = 10 *pi/180;
xnew = [];  ynew =[];
for i=1:npts
  thetai = theta + .2*(rand(1)-.5);
  c = cos(thetai); s = sin(thetai);
  R = [c -s; s c];
  xy = R*[x(i);y(i)];
  xnew = [xnew xy(1)]; ynew = [ynew xy(2)];
end
hold on
plot(xnew,ynew,'o');
plot([0 xnew(1)],[0 ynew(1)],':')
A = [x;y];
B = [xnew;ynew];

[u,s,v] = svd(B*A');
Q = u*v'
Q = v*u';
thetahat = asin(Q(1,2))*180/pi
print -dps ../pictures/procruses.ps
print -deps ../pictures/procruses.eps
