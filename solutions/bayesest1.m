% Example of non-Gaussian Bayes estimate

% Copyright 1999 by Todd K. Moon

a = 1/4;   q=1/6;                      % initial probabilities
attm1 = a;    qttm1 = q;               % set up a(0|-1) and q(0|-1)
zlist = [0 1 1 1];                         % sequence of observations
for z = zlist                          % note:  delta(z) = (z==0)
  % update step
  att = attm1*((1-z) == 0)/((1-attm1)*(1-q)*(z==0) + ...
           (attm1 + q - attm1*q)*((1-z)==0))
  qtt = q*((1-z) == 0)/((1-attm1)*(1-q)*(z==0) + ...
           (attm1 + q - attm1*q)*((1-z)==0))
  % propagate step
  attm1 = a+att/2;
  qttm1 = q;
end