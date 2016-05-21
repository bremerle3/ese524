function g = bernpoly(n,k,t)
% 
% compute the Bernstein polynomial g_{nk}(t)
%
% function g = bernpoly(n,k,t)
%
% n = degree
% k = order
% t = location
% 
% g = value

% Copyright 1999 by Todd K. Moon

nck = fact(n)/(fact(k)*fact(n-k));
g = nck * t.^k .* (1-t).^(n-k);