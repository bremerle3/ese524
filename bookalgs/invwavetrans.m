function c = invwavetrans(C,ap,coeff)
%
% Compute the inverse discrete wavelet transform 
%
% function c = invwavetrans(C,ap,coeff)
%
% C = input data (whose inverse transform is to be found)
% ap = index for start of coefficients for the jth level
% coeff = wavelet coefficients
%
% c = inverse transformed data

% Copyright 1999 by Todd K. Moon

N = length(coeff);
h = coeff;
nlist = (N:-1:1)';
g = coeff(end:-1:1).*(-1).^nlist;
J = length(ap)-2;      % number of levels to rebuild
cj = C(ap(end):end);   % get the lowpass coefficients
lj = length(cj);
for j=J:-1:1
  cjm1 = [];
  dj = C(ap(j+1):ap(j+2)-1)
  if(j > 1)
    ljm1 = ap(j+1)-ap(j);
  else
    ljm1 = ap(1)
  end
  for n=N+1:N+ljm1
    csum = 0;
    for k=max(1,fix((n+1-N)/2)):min(lj,fix((n-1)/2))
      csum = csum + h(n-2*k)*cj(k) + g(n-2*k)*dj(k);
    end
    cjm1 = [cjm1;csum];
  end
  cj = cjm1;
  lj = ljm1;
end
c = cj;