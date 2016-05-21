function c = divdiff(ts,fs)
% 
% Compute the upper row of a divided difference table
%
% function c = divdiff(ts,fs)
%
% ts = sample locations
% fs = function values
%
% c = set of divided differences

% Copyright 1999 by Todd K. Moon

n = length(ts)-1;
for i=1:n+1
  c(i) = fs(i);
end
for j=1:n
  for i=n+1:-1:j+1
    c(i) = (c(i) - c(i-1))/(ts(i) - ts(i-j));
  end
end