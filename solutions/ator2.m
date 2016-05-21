function [sigma2,r1,r2] = ator2(a1,a2,sigmaf2)
% 
% Given the coefficients from a 2nd-order AR model
% y[t+2] + a1 y[t+1] + a2 y[t] = f[t+2],
% where f has variance sigmaf2, compute sigma_y^2, r[1], and r[2].
% 
% function [sigma2,r1,r2] = ator2(a1,a2,sigmaf2)
%
% a1, a2 -- AR model coefficients
% sigmaf2 -- input noise variance
%
% sigma2 -- output noise variance
% r1, r2 -- covariance values

% Copyright 1999 by Todd K. Moon

sigma2 = sigmaf2* (1+a2)/((1-a2)*((1+a2)^2 - a1^2));
r1 = -sigma2*a1/(1+a2);
r2 = sigma2*(a1^2/(1+a2) - a2);

