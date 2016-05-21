function s = haarinv1(h,nlevel)
% Do the computations for the inverse Haar transform, working toward the
% wavelet lifting transform

% Copyright 1999 by Todd K. Moon

L = length(h);
n = log2(L);
if(n ~= round(n))
  error('Sequence length must be a power of 2');
end
if(nargin==1)
  nlevel = n;
end
skip = L/2^(n-nlevel)
for i=1:nlevel
  eveni = 1:skip:L-1
  oddi = skip/2+1:skip:L
  skip = skip/2;
  h(eveni) = h(eveni) - h(oddi)/2; % U = identity/2
  h(oddi) = h(oddi) + h(eveni);    % P = identity
end
s = h;