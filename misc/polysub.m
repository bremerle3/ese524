function p = polysub(a,b)
% 
% Subtract the polynomials p=a-b
%
% a,b = polynomials
%
% p = difference

% Copyright 1999 by Todd K. Moon

k = length(b) - length(a);
p = [zeros(1,k) a] - [zeros(1,-k) b];
if(all(p==0))
  p = 0;
else
  p = p(find((p==0)==0):end);   % get rid of leading zeros
end