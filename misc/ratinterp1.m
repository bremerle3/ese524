function f = ratinterp1(t,ts,fs,phis)
% 
% Compute a single interpolated point f(t) given the interpolating data
% and the inverse differences
%
% function f = ratinterp1(t,ts,fs,phis)
%
% t = point at which to evaluate
% ts = vector of independent data
% fs = vector of depdendent data
% phis = inverse differences
%
% f = interpolated value

% Copyright 1999 by Todd K. Moon


n = length(ts);
D = 1;
N = phis(n);
for j=n-1:-1:1
  oldD = D;
  D = N;                    % flip the last one upside down
  N = (t - ts(j)) .* oldD + phis(j) .* D;
end
f = N ./ D;