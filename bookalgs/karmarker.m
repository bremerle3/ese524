function x = karmarker(A,c)
% 
% Implement a Karmarker-type algorithm for linear programming
% to solve a problem in "Karmarker standard form"
%  min       c'x
% subject to Ax=0,  sum(x)=1, x >=0
%
% function x = karmarker(A,c)
%
% A,c = system matrices
%
% x = solution

% Copyright 1999 by Todd K. Moon

[m,n] = size(A);
e = ones(n,1);
% the initial feasible vector is in the middle of the simplex
x = e;
lastx = x;
maxiter = 100;

for i=1:maxiter
  X = diag(x);
  Bk = [A*X;e'];
  PBk = eye(n) - Bk'*pinv(Bk');
  chat = X*c;
  dhat = -PBk*chat;           % gradient search direction
  dhat = dhat/norm(dhat);

  % if any negative values, limit the range of update
  dn = dhat(dhat<0);
  if(dn) 
  amax = .98*min(-1 ./ dn);
  else
  amax = 5;
  end
  alpha =1/3;
  % An alternative is to do a line search on f(x + alpha d) to find the minimum

  % Update the solution
  xtilde = x + alpha*X*dhat;
  x = n*xtilde/sum(xtilde);
  newf = karf(x,c);
  if(norm(x - lastx) < 1.e-10)
  disp('no change: stopping')
  break;
  end
  lastx = x;
end