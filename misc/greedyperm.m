function P = greedyperm(x,z)
% 
% Using a greedy algorithm, determine a permutation P such that Px=z
% as closely as possible.
%
% function P = greedyperm(x,z)

% Copyright 1999 by Todd K. Moon

x = x(:);  z = z(:);

n = length(x);
n1 = n;
Pz = 1:n;
for i=1:n
  d0 = realmax;
  for j=1:n1
	d = abs(x(1) - z(j));
	if(d < d0)
	  d0 = d; 
	  jmin = j;
	end
  end
  P(i) = Pz(jmin);
  x = x(2:n1);
  z = z([1:jmin-1 jmin+1:n1]);
  Pz = Pz([1:jmin-1 jmin+1:n1]);
  n1 = n1-1;
end