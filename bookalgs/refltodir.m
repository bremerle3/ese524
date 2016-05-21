function a = refltodir(kappa)
% 
% Convert from a set of reflection coefficients kappa(1)...kappa(m)
% to FIR filter coefficients in direct form
%
% function a = refltodir(kappa)
%
% kappa = vector of reflection coefficients
%
% a = output filter coefficients = [1 a(1) a(2) ... a(m)]

% Copyright 1999 by Todd K. Moon

m = length(kappa);  a = 1;
for k=1:m
  a = a + kappa(k)*conj(a(k-1:-1:1));
  a = [a; kappa(k)]
end
% add on the first (unity) coefficient
a = [1; a];