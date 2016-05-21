% a plot showing an attractor

% Copyright 1999 by Todd K. Moon

x=0:.01:5;
fs = '.2*(x-.6).^3 -x + 1';
clf;
subplot(2,2,1)
plot(x,eval(fs),[-1 5],[-1 5],':');
axis('square')
hold on
%axis equal
axis([-1 5 -1 5])
% axis(axis)
x=3.75; ly = -1;
for iter=1:3
  y = eval(fs);
  plot([x x],[ly,y],'--')
  plot([x y],[y,y],'--')
  x = y;  ly = y;
end
text(3.79,-.85,'x^{[0]}')
text(3.79,3.5,'x^{[1]}')
text(2.4,2.6,'x^{[2]}')
print -dps ../pictures/attract2.ps
print -deps ../pictures/attract2.eps