function [c,s] = qrtheta(x,y)
% 
% Given x and y, compute cos(theta) and sin(theta) for a Givens rotation
%
% function [c,s] = qrtheta(x,y)
%
% (x, y) = point to determine rotation
%
% c = cos(theta),   s=sin(theta)

% Copyright 1999 by Todd K. Moon

if y == 0
  c=1; s=0;
else
  if(abs(y) > abs(x))
    t = -x/y; s = 1/sqrt(1+t^2); c = s*t;
  else
    t = -y/x; c = 1/sqrt(1+t^2); s = c*t;
  end
end