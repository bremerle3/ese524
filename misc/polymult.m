function p = polymult(a,b)
% 
% Multipoly the polynomials p=a*b
%
% function p = polymult(a,b)
%
% a,b = polynomials
%
% p = product

% Copyright 1999 by Todd K. Moon

if(all(a==0) | all(b==0))
  p = 0;
else
  k = length(b) - length(a);
  p = conv(a,b);
end