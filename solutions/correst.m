function r = correst(x)
% 
% Estimate the autocorrelation function
% the returned values are offset (by Matlab requirements) so that
% r(1) = r[0], etc.
% Only correlations for positive lags are returned.  For other values,
% use the fact that r[k] = conj(r[-k])
%
% function r = correst(x)
%
% x = data sequence
%
% r = estimated correlations

% Copyright 1999 by Todd K. Moon

x = x(:);    % convert to columns
n = length(x);
r = conv(x,flipud(conj(x)));
r = r(n:end);
