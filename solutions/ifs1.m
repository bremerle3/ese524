% test some ifs stuff
% Copyright 1999 by Todd K. Moon

lambda = 1;
theta = 2.325
c = cos(theta);
s = sin(theta);
e = 1;
A = [c -s; s c]*[e lambda; 0 1];
b = [1; 1];
%b = [0;0];

x = [1;1];
hold off;
plot(x(1),x(2));
hold on;
for i=1:1000
  x = A*x + b;
  plot(x(1),x(2));
  for wait=1:100
    t = sqrt(wait);
  end
end