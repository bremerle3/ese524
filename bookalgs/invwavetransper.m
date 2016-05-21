function c = invwavetransper(C,coeff,J)
%
% Compute the periodized inverse discrete wavelet transform 
%
% function c = invwavetransper(C,coeff,J)
%
% C = input data
% coeff = wavelet coefficients
% J = (optional) number of levels of inverse transform to compute
%    If length(C) is not a power of 2, J must be specified.
%
% c = inverse discrete wavelet transform of C

% Copyright 1999 by Todd K. Moon

if(nargin==2)
  J = nextpow2(C);
end
N = length(coeff);  L = length(C);
nlist = (N:-1:1)';
h = coeff;   g = coeff(end:-1:1).*(-1).^nlist;
d = L/2; p = 1;   % find the ending point
for j=J:-1:1
  p = p+d;
  d = fix(d/2);
end
cj = C(p:end);
d = length(cj);
for j=1:J           % loop over the number of levels
  p = p - d;
  dj = C(p:p+d-1);
  d2 = d*2;
  cjm1 = zeros(d2,1);
  for k=0:d-1       % the main loops
    for n=0:N-1
      id = mod(n+2*k,d2)+1;
      cjm1(id) = cjm1(id) + cj(k+1)*h(n+1) + dj(k+1)*g(n+1);
    end
  end
  d = d2;  cj = cjm1;
end
c = cj;