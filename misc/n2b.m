function c = n2b(n,m)
% convert n to an m-bit binary representation
c = zeros(1,m);
for i=1:m
  c(i) = rem(n,2);
  n = floor(n/2);
end
	
