function x = genardat(a,sigma,N)
% 
% Generate N points of AR data with a = [a(1) a(2), \ldots, a(n)]'
% and input variance sigma^2
%
% function x = genardat(a,sigma,N)
%
% a = AR parameters
% sigma = standard deviation of input noise
% N = number of points
%
% x = AR process

% Copyright 1999 by Todd K. Moon

n = length(a);
xar = zeros(n,1);
x = [];
for i=1:N+n
  xnew = xar.'*a + sigma*randn;
  xar = [xnew; xar(1:n-1)];
  if(i > n) 
	x = [x;xnew];
  end
end