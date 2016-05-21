function [x,y] = plotplane(m,x0,startx,upx)
% determine points in the plane m'(x-x0) = 0 for plotting purposes
% 
% Copyright 1999 by Todd K. Moon

if(m(2)==0)
  error('not set up to plot vertical lines');
else
  x = linspace(startx,upx,10);
  y = m(1)/m(2)*(x0(1)-x) + x0(2);
end