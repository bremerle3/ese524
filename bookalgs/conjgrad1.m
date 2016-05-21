function [x,D] = conjgrad1(Q,b)
% function [x,D] = conjgrad1(Q,b)
%
% Solve the equation Qx = b using conjugate gradient, where Q is symmetric
%
% Q = symmetric matrix
% b = right-hand side

% x = solution
% D = (optional) array of conjugate direction vectors

% Copyright 1999 by Todd K. Moon

[m,n] = size(Q);  % assume square and symmetric; should test

% Initial values
x = zeros(n,1); x(1) = 1;  g = Q*x - b;
d = -g;
if(nargout==2)  D = [];  end
while(norm(g) > 1.e-8)
  alpha = -g'*d/(d'*Q*d);
  x = x + alpha*d;
  if(nargout == 2)  D = [D d];  end
  g = Q*x - b;
  beta = g'*Q*d/(d'*Q*d);
  d = -g + beta*d;
end