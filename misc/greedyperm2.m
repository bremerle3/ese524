function P = greedyperm2(x,z)
% 
% Using a greedy algorithm, determine a permutation P such that Px=z
% as closely as possible.
% This algorithm is more complex than greedyperm
%
% function P = greedyperm2(x,z)

% Copyright 1999 by Todd K. Moon

x = x(:);  z = z(:);

n = length(x);
n1 = n;
Pz = 1:n;
Px = 1:n;

for k=1:n
  d0 = realmax;
  for i=1:n1
	for j=1:n1
	  d = abs(x(i) - z(j));
	  if(d < d0)
		d0 = d;
		imin = i;
		jmin = j;
	  end
	end
  end
  % the best match to remaining data has been found
  P(Pz(jmin)) = Px(imin);
  x = x([1:imin-1 imin+1:n1]);
  Px = Px([1:imin-1 imin+1:n1]);
  z = z([1:jmin-1 jmin+1:n1]);
  Pz = Pz([1:jmin-1 jmin+1:n1]);
  n1 = n1-1;
end