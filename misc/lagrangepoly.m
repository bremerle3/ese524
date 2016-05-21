function p = lagrangepoly(t,i,ts)
% 
% Lagrange interpolator

% function p = lagrangepoly(t,i,ts)

% Copyright 1999 by Todd K. Moon

n = length(ts);
p = 1;
for j=0:n-1
  if(i ~= j)
    p = p .* (t-ts(j+1)) ./ (ts(i+1) - ts(j+1));
  end
end