function B = houseleft(A,v)
%
% Apply the Householder transformation based on v to A on the left
%
% function A = houseleft(A,v)
%
% A = an mxn matrix
% v = a household vector
%
% B = H_v A

% Copyright 1999 by Todd K. Moon

if(any(v))
  w = A'*v;
  beta = -2/(v'*v);
  B = A + beta * v*w';
else
  B = A;
end