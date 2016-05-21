function [C] = wavetransper(c,coeff,J)
%
% Compute the periodized discrete wavelet transform of the data
%
% function [C] = wavetransper(c,coeff,J)
%
% c = data to be transformed
% coeff = transform coefficients
% J indicates how many levels of the transform to compute.
%    If length(c) is not a power of 2, J must be specified.
%
% C = output vector
%    The output is stacked in C in wavelet-coefficient first order,
%    C = [d1 d2 ... dJ cJ]

% Copyright 1999 by Todd K. Moon

% This function essentially just stacks up the data for a call to wave

N = length(coeff);
h = coeff;
nlist = (N:-1:1)';
g = coeff(end:-1:1).*(-1).^nlist;
if(nargin==2)
  J = nextpow2(length(c));
end
hg = [h g];  % stack to perform both computations
C = [];
[C] = wave(c,hg,N,C,J);


%--------------------------------------------------------
function [C,ap] = wave(c,hg,N,C,J)
% 
% Compute the wavelet transform of c
%
% c = data to be transformed
% hg = stack of h and g coefficients
% N = number of data points
% C = transformed data (for recursive calls)
% J = number of levels

if(J==0)
  C = [C;c]; return;
end
L= length(c);
cdlist = [];
for k=0:L/2-1
  ckdk = [0 0];
  for n=0:N-1
  ckdk = ckdk + hg(n+1,:)*c(mod(n+2*k,L)+1);
  end
  cdlist = [cdlist;ckdk];
end
C = [C;cdlist(:,2)];  % stack up the highpass part
C = wave(cdlist(:,1),hg,N,C,J-1);