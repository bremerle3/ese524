% generate elements in GF(5^2) using p(x) = x^2 + x+2
% Copyright 1999 by Todd K. Moon

g = [1];
for i=0:25
  disp(g)
  g = mod(polymult(g,[1 0]),5);
  [q,g] = polydivgfp(g,[1 1 2],5);
end