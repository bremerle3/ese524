% test the Sugiyama algorithm
% Copyright 1999 by Todd K. Moon

p = 3;
%p = 2;
a1 = 5;
a2 = 3;
a3 = 2;
y0=1;
y1=2;
y2=-2;
a = [a1;a2];
a = [a1;a2;a3];
yv = [y2;y1;y0];
%yv = [y1;y0];
%y = [y0;y1];
y = [y0;y1;y2];

ap = [a3; a2; a1; 1];           % the polynomial form
%ap = [a2; a1; 1];           % the polynomial form
for t=p:2*p-1
  yn = -a' * yv;
  y = [y;yn];
  yv = [yn;yv(1:length(yv)-1)];
end
y = flipud(y);
x2n = zeros(1,2*p+1);
x2n(1) = 1;  % x^(2n)
ay = conv(ap,y);
sugiyama(y)

