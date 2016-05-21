function x = rdigits(y,digits)
% 
% round the input to digits places
%
% function x = rdigits(y,digits)
%
% y = input value
% digits = number of digits
%
% x = rounded value

% Copyright 1999 by Todd K. Moon

rfact = 10^digits;
x = y;
n = length(y);
for i=1:n
  if(y(i)) 
	xp = ceil(log10(abs(y(i))));
	x(i) = round(rfact*(y(i)/(10^xp)))/rfact;
	x(i) = x(i)*10^xp;
  end
end
