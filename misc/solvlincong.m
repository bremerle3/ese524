function x = solvlincong(a,m,b) 
% 
% Ddetermine the solution to the linear congruence
% a x equiv b (mod m), if it exists
%
% function x = solvlincong(a,m,b)

% Copyright 1999 by Todd K. Moon

[g,x,y] = gcdint2(a,m);
if(rem(b,g))
  error('no solution to the congruence');
end
alpha = a/g;
beta = b/g;
mu = m/g;
[g1,alphabar,gamma] = gcdint2(alpha,mu);
x0 = mod(alphabar*beta,m);
x = mod(x0+(0:g-1)*mu,m);