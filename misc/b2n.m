function n = b2n(b,m)
% convert an m-bit binary sequence b to an integer
n = 0;
for i=1:m
  n = n + b(i)*2^(i-1);
end
	
