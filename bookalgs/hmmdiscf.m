function f = hmmdiscf(y,f,s)
%
% Compute the pmf value for a discrete distribution
%
% function f = hmmdiscf(f)
% 
% y = output value
% f = output distribution
% s = state

% Copyright 1999 by Todd K. Moon

f = f{2}(y,s);