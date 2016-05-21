function P = findperm(x,z,maxiter)
% 
% Determine a permutation P such that Px = z (as close as possible)
% using a composite mapping
%
% function P = findperm(x,z,maxiter)
%
% x = input data (to be permuted)
% z = permuted data
% maxiter = optional argument on number of iterations
%
% P is an index listing, so the permutation is obtained by x(P) = z.

% Copyright 1999 by Todd K. Moon

if(nargin==2)
  maxiter=10;
end

x = x(:);  z = z(:);
n = length(x);
P = 1:n;
e = 1;  iter = 0;  laste = 0;
rows = 1:n;  cols = 1:n;
while(e & iter < maxiter)
  iter = iter+1;
  Ptilde = z*x'*pinv(x*x');
  Phat = zeros(1,n);
  for i=1:n
	[m,idx1] = max(abs(Ptilde));
    [mx,idx2] = max(m);
	Phat(idx1(idx2)) = idx2;
    Ptilde(idx1(idx2),:) = zeros(1,n);
    Ptilde(:,idx2) = zeros(n,1);
  end
  x = x(Phat);
  e = max(x-z);
  if(e == laste)
    e = 0;
  end
  laste = e;
  P = P(Phat);
end