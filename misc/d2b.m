function c = d2b(n,m)
% convert n to an m-bit binary representation
mask = 1;
c = zeros(1,m);
for i=1:m
  if(bitand(mask,n))
	c(i) = 1;
  end
  mask = mask*2;
end
	
