function [A,B] = padefunct(c,m,k)
% 
% Find the Pade approximation from the Maclaurin series coefficients
%
% function [A,B] = padefunct(c,m,k)
%
% c = Maclaurin series coefficients (need m+k+1)
% m = degree of numerator polynomial
% k = degree of denominator polynomial
%
% A = coefficients of numerator polynomial (in Matlab order)
% B = coefficients of denominator polynomial (in Matlab order)

% Copyright 1999 by Todd K. Moon

C = zeros(k,k);
cb = zeros(k,1);
for j=1:k
  for l=1:k
    if(m-l+j+1 < 1) 
      break; 
    end
    C(j,l) = c(m-l+j+1);
  end
  cb(j) = -c(m+j+1);
end
b = [1;C\cb];

a = [];
for r = 0:m
  s = 0;
  for j=0:min(r,k)
    s = s+c(r+1-j)*b(j+1);
  end
  a(r+1,1) = s
end
A = a(m+1:-1:1)
B = b(k+1:-1:1)
