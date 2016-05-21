function f = hmmgausf(y,f,s)
% 
% Compute the pmf value for a Gaussian distribution
%
% function f = hmmgausf(y,f,s)
%
% y = output value
% f = output distribution
% s = state

% Copyright 1999 by Todd K. Moon

m = length(y); 

% For many distributions, there may be numeric problems with the
% computation, so the pseudo inverse is used in an attempt to stabilize it. 
% There are frequently still problems!

%f =1/((2*pi)^(m/2)*sqrt(abs(det(f{3,s}))))*exp(-.5*(y-f{2,s})'*pinv(f{3,s})...
%        * (y-f{2,s}));

f = sqrt(abs(det(pinv(f{3,s}))))/((2*pi)^(m/2))...
    *exp(-.5*(y-f{2,s})'*pinv(f{3,s}) * (y-f{2,s}));