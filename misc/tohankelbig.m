function [A,diff] = tohankelbig(A,r,d)
% 
% Determine the matrix nearest to A which is (block) Hankel and has rank r
% using the composite mapping algorithm
%
% function A = tohankelbig(A,r)
%
% A = input matrix
% r = desired ranke
% d = (optional) block size (default=1)
%
% A = nearest rank r Hankel matrix
% diff = norm of difference between matrices

% Copyright 1999 by Todd K. Moon

if(nargin==2) d = 1; end
[m,n] = size(A);
m = m/d;              % number of blocks
if(r > min(m,n))
  error('Cannot satisfy rank requirement');
end
np = m+n-1;
 
numiter = 0;
maxiter = 200;
if(nargout == 2)
  saveA = A;
end
v = zeros(np,1);                      % vector of parameters
while(numiter < maxiter)
  numiter = numiter+1;
  oldA = A;
  for i=1:n             % work on the variables across the top
	s = zeros(d,1); 					% find average
    for j=0:min(i,m)-1  % number of times the variable appears in Hankel matrix
	  s = s+A(d*j+1:d*(j+1),i-j);
    end
	s = s/min(i,m);
	for j=0:min(i,m)-1 			% replace the variables with the average
      A(d*j+1:d*(j+1),i-j) = s;
    end
  end
  for i=2:m 							% work on variables down the side
	s = zeros(d,1);
    for j=0:m-i
	  s = s+A(d*(i+j-1)+1:d*(i+j),n-j);
	end
    s = s/(m-i+1);
    for j=0:m-i
      A(d*(i+j-1)+1:d*(i+j),n-j) = s;
    end
  end
  [ua,sa,va] = svd(A);                % enforce the rank property
  A = zeros(size(A));
  for i=1:r
    A = A+ sa(i,i)*ua(:,i)*va(:,i)';
  end
  nm = norm(A-oldA);
  if(nm < 2)
    break;
  end
  oldA = A;
end
if(nargout == 2)
  diff = norm(saveA - A);
end