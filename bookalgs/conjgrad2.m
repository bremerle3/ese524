function [x,X] = conjgrad2(x,grad,hess)
%
% Apply the conjugate gradient to minimize a function
%
% function [x,X] = conjgrad2(x,grad,hess)
%
% x = starting point
% grad = the gradient of the function to minimize (a function name)
% hess = the gradient of the function to minimize (a function name)
%
% Output x = update of point
% X = array of points examined (optional)

% Copyright 1999 by Todd K. Moon

if(nargout == 2)  X = [x]; end
g = eval([grad,'(x)']);
Q = eval([hess,'(x)']);
if(norm(g) < 1.e-6)                  % gradient small enough: at the min.
  return;
end
n = size(x);                         % dimension of x
done = 0;
maxiter = 200;                       % max. number of iterations
numiter = 0;
while(~done & numiter < maxiter)     % restart
  numiter = numiter + 1;
  d = -g;                            % start with d = -gradient
  for k=0:n-1                        % do at most n steps
    alpha = -g'*d/(d'*Q*d)
    xn = x + alpha*d;
    if(nargout == 2) X = [X xn]; end
    if(norm(xn - x) < 1.e-6) 
      x = xn;
      done = 1;
      break;
    end
    x = xn;
    g = eval([grad,'(x)']);
    Q = eval([hess,'(x)']);
    if(k ~= n-1)
      beta = g'*Q*d/(d'*Q*d);
      d = -g + beta*d;
    end
  end
end