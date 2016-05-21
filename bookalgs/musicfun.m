function pf = musicfunc(f,p,V)
%
% Compute the "MUSIC spectrum" at a frequency f.
%
% function pf = musicfunc(f,p,V)
%
% f = frequency (may be an array of frequencies)
% p = order of system
% V = eigenvectors of autocorrelation matrix
%
% pf = plotting value for spectrum

% Copyright 1999 by Todd K. Moon

nf = length(f);
[M,M] = size(V);
id = 0:M-1;
 
for fcount=1:nf 
  mf = 0;
  s = exp(2*pi*j*f(fcount) .* id);
  for k=p+1:M
    temp = s*V(:,k);
    mf = mf + temp'*temp;
  end
  pf(fcount) = 1/mf;
end