% Minimax decision for Gaussian

% Copyright 1999 by Todd K. Moon

f = 1;     c = 10;   mu =  1;  % some starting value
for k=1:20
  newmu = qfinv(1/c*(1-qf(mu-f)))
  if(abs(newmu - mu) < 1.e-4) break; end;
  mu = newmu;
end
eta = f*mu - d^2/2;
% find the value of the game (L10=1)  (both ways to verify minimax)
L10 = 1;
r1 = L10*(1-qf(mu-f));
r2 = c*L10*qf(mu);

% find the lfp (method 1)
s = c * (exp(-(mu)^2/2) / exp(-(mu-f)^2/2));
p0 = 1/(s+1)