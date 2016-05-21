function grad = rosengrad(x)
% 
% compute the gradient of the rosenbrock function for test purposes
% function grad = rosengrad(x)

% Copyright 1999 by Todd K. Moon

grad = [-400*x(1)*(x(2) - x(1)^2) + 2*(x(1)-1);
          200*(x(2) - x(1)^2)];
