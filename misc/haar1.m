function h = haar1(s,nlevel)
% Do the computations for the Haar transform, working toward the
% wavelet lifting transform
%
% s = input data
% nlevel = number of levels
%
% h = Haar transform

% Copyright 1999 by Todd K. Moon

L = length(s);
n = log2(L);
if(n ~= round(n))
  error('Sequence length must be a power of 2');
end
if(nargin==1)
  nlevel = n;
end
idx = 1:L;

for i=1:nlevel
  eveni = idx(1:2:L-1);            % indices for even and odd
  oddi = idx(2:2:L);
  s(oddi) = s(oddi) - s(eveni);    % P = identity
  s(eveni) = s(eveni) + s(oddi)/2; % U = identity/2
  idx = eveni;
  L = L/2;
end
h = s;