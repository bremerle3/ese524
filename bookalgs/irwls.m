function c = irwls(A,x,p)
% 
% Computes the minimum solution c to ||x-Ac||_p using
% iteratively reweighted least squares
%
% function c = irwls(A,x)
%
% A = system matrix
% x = rhs of equation
% p = L_p norm
%
% c = solution vector

% Copyright 1999 by Todd K. Moon

pk = 2;                       % starting value of p
% Find an initial solution (least-squares)
c = A\x;
xhat = A*c;
 
gamma=1.5;
maxiter = 200;  stopeps = 1.e-5;   % system convergence parameters
 
for k=1:maxiter
  pk = min([p,gamma*pk]);     % p for this iteration
  e = x-xhat;                 % estimation error
  s = abs(e).^((pk-2)/2);         % new weights
  
  WA = diag(s)*A;             % weighted matrix
  chat = WA\(s .* x);         % weighted least-squares solution
  lambda = 1/(pk-1);
  cnew = lambda*chat + (1-lambda)*c;
  if(norm(c-cnew) < stopeps)
  c = cnew;
  break;
  end
  c = cnew;
  xhat = A*c;
end