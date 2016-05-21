function x = poisson(lambda)
% 
% Generate a sample of a random variable x with mean lambda
% (Following Numerical Recipes in C, 2nd ed., p. 294)
% This function should be initialized by initpoisson.m
%
% function x = poisson(lambda)
%
% lambda = Poisson mean
%
% x = Poisson random variable

% Copyright 1999 by Todd K. Moon

global sq alxm g oldm;

if(lambda<12)
  if(lambda ~= oldm)
    oldm = lambda;
    g = exp(-lambda);
  end
  em = -1;
  t = 1;
  while(1)
    em = em+1;
    t = t*rand;
    if(t <= g) break; end;
  end
else
  if(lambda ~= oldm)
    oldm = lambda;
    sq = sqrt(2*lambda);
    alxm = log(lambda);
    g = lambda*alxm - gammaln(lambda+1);
  end
  while(1)
    while(1)
      y = tan(pi*rand);
      em = sq*y+lambda;
      if(em >= 0) break; end
    end
    em = floor(em);
    t = 0.9*(1 + y^2)*exp(em*alxm - gammaln(em+1) - g);
    if(t >= rand) break; end
  end
end
x = em;