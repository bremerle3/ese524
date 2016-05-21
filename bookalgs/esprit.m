function f = esprit(Ryy,Ryz,p)
%
% Compute the frequency parameters using the ESPRIT method
%
%function f = esprit(Ryy,Ryz,p)
%
%
% Ryy = (estimate of) the autocorrelation of the observations
% Ryz = (estimate of) the correlation between y[n] and y[n+1]
% p = number of modes
%
% f = vector of frequencies (in Hz/sample)

% Copyright 1999 by Todd K. Moon

[M,M] = size(Ryy);
[u,v] = eig(Ryy);
sigmaw2 = v(M,M);    % estimate of noise power
% Compute the estimate of the signal autocorrelation
Rxx = Ryy - sigmaw2*eye(M);
% Compute the estimate of the signal crosscorrelation
Q = diag(ones(M-1,1),-1);
Cyz = Ryz - sigmaw2*Q;
% Compute the generalized eigendecomposition
[V,D] = eig(Rxx,Cyz)
f = [];
% find the eigenvalues nearest the unit circle
for k=1:M
  ftemp = D(k,k);
  if(abs(abs(ftemp) - 1) < 1.e-5)       % if close enough
    f = [f angle(ftemp)/(2*pi)];
  end
end