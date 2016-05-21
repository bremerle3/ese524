% a plot showing an attractor

% Copyright 1999 by Todd K. Moon

x=0:.01:1;
fs = '3*(x-.6).^3 -x + 1';
clf;
subplot(2,2,1)
plot(x,eval(fs),[0 1],[0 1],':');
axis('square')
hold on
%axis equal
%axis([0 1 0 1])
% axis(axis)
x=.15; ly = 0;
for iter=1:10
  y = eval(fs);
  plot([x x],[ly,y],'--')
  plot([x y],[y,y],'--')
  x = y;  ly = y;
end
text(.15,-.03,'x^{[0]}')
text(.15,.63,'x^{[1]}')
print -dps ../pictures/attract1.ps
print -deps ../pictures/attract1.eps