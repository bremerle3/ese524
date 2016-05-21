% data for a modal analysis problem
% Copyright 1999 by Todd K. Moon

j = sqrt(-1);
p1 = -.3;
p2 = .2*exp(j*2*pi/5);
p3 = .2*exp(-j*2*pi/5);
g = conv(conv([1 -p1],[1 -p2]),[1 -p3])
coef = g(2:4)';

y = [.1;.25;.32]
ylist = flipud(y);
for i=1:5
  ynew = -y'*coef
  y = [ynew;y(1:2)];
  ylist = [ylist;ynew];
end

% now test by setting up the equations
A = [];
b = [];
for i=1:3
  A = [A; -ylist(i+2:-1:i)'];
  b = [b; ylist(i+3)];
end
poly = [1 (A\b)']