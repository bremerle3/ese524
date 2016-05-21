% data for  Chebyshev interpolation example
% Copyright 1999 by Todd K. Moon
 

t = [1 3 4 -2]
f = [4 90 223 -35]

for i=1:4
  A(i,1) = 1;
  b(i,1) = f(i);
end
for i=1:4
  A(i,2) = t(i);
end
for i=1:4
  A(i,3) = 2*t(i)^2 -1;
end
for i=1:4
  A(i,4) = 4*t(i)^3 - 3*t(i);
end
a = A\b