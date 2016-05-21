% Illustration of example em algorithm computations
%
% Copyright 1999 by Todd K. Moon

% Initialize the data

x1 = 25;  x2 = 38;  x3=37;
y1 = x1+x2;  y2 = x3;
maxsteps = 10;
p = 0;      % initial value of p
% Now iterate the EM algorithm
for i = 1:maxsteps
  % E-step.  Estimate x2 only (in this case)
  x2e = y1*(1/4 + p/4)/(1/2 + p/4);
  % M-step
  p = (2*x2e-x3)/(x2e + x3);
  fprintf(1,'i=%d  x2e=%f   p=%f\n',i,x2e,p);
end