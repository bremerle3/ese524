function a = vandsolve1(ts,fs)
%
% Solves the equation Vx = fs, where V is the Vandermonde
% matrix determined from ts.
%
% function a = vandsolve1(ts,fs)
%
% ts = abscissa values
% fs = ordinate values
%
% a = solution

% Copyright 1999 by Todd K. Moon

n = length(ts)-1;
c = divdiff(ts,fs);                     % find the divided differences
a = c;
for k=n-1:-1:0
  for i=k:n-1
    a(i+1) = a(i+1) - ts(k+1)*a(i+2);
  end
end