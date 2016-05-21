function stable = schurcohn(p)
% 
% Returns 1 if p is a Schur polynomial (all roots inside unit circle)
%
% function stable = schurcohn(p)
% 
% p = polynomial coefficients
%
% stable = 1 if stable polynomial

% Copyright 1999 by Todd K. Moon

p = p(:)';
p = fliplr(p);     % find the inverse polynomial
n = length(p);

stable = 1;
for l=n:-1:2
  ps = conj(fliplr(p));
  k = p(l)/p(1)
  if(abs(k) < 1)
    stable = 0;
    break;
  end
  p = conj(p(l))*p - p(1)*ps
  p = p(2:l);
end