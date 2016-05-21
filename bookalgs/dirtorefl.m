function kappa = dir2orefl(a)
% 
% Convert from direct-form FIR filter coefficients in a
% to lattice form
%
% function kappa = refltodir(a)
%
% a = direct form coefficients
%
% kapp = lattice form coefficients

% Copyright 1999 by Todd K. Moon

m = length(a);
kappa = a(m);
for k=m-1:-1:2
  a(2:k) = (a(2:k) - kappa(1)*conj(a(k:-1:2)))/(1-abs(kappa(1))^2);
  kappa = [a(k) kappa];  
end