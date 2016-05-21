function B = houseright(A,v)
%
% Apply the householder transformation based on v to A on the right
%
% function A = houseright(A,v)
%
% A = an mxn matrix
% v = a household vector
%
% B = H_v A

% Copright 1999 by Todd K. Moon

if(any(v))
  w = A*v;
  beta = -2/(v'*v);
  B = A + beta * w*v';
else
  B = A;
end