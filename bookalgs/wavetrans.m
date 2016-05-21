function [C,ap] = wavetrans(c,coeff,J)
%
% Compute the (nonperiodized) discrete wavelet traqnsform 
%
% function [C,ap] = wavetrans(c,coeff,J)
%
% c = data to be transformed
% coeff = wavelet transform coefficients
% J = number of levels of transform
%    If J is specified, then J levels of the transform are computed.  
%    Otherwise, the largest possible number of levels are used.
%
% C = transformed data
%     The output is stacked in C in wavelet-coefficient first order,
%     C = [d1 d2 ... dJ cJ]
% ap indexes the start of the coefficients for the jth level,
%     ap(j+1) indexes the start of the coefficients for the jth level,
%     except that ap(1) indicates the number of original datapoints
%
% This function simply stacks up the data for a call to the function wave

% Copyright 1999 by Todd K. Moon

N = length(coeff);
h = coeff;
nlist = (N:-1:1)';
g = coeff(end:-1:1).*(-1).^nlist;
if(nargin==2)
  J = nextpow2(length(c));
end
hg = [h g];  % stack to perform both computations
C = [];
ap = length(c);
[C,ap] = wave(c,hg,N,C,J,ap);

%--------------------------------------------------------

function [C,ap] = wave(c,hg,N,C,J,ap)
% 
% Compute the wavelet transform of c
%
% c = data to be transformed
% hg = stack of h and g coefficients
% N = number of data points
% C = transformed data (for recursive calls)
% J = number of levels
% ap = indexing

if(J==0)
  ap = [ap;length(C)+1];
  C = [C;c];
  return
end
L= length(c);
cdlist = [];
for k=-(N/2-1):(L-1)/2
  ckdk = [0 0];
  for n=max(1,2*k+1):min(L,2*k+N)         % filter/decimate
    ckdk = ckdk + hg(n-2*k,:)*c(n);
  end
  cdlist = [cdlist;ckdk];
end
ap = [ap;length(C)+1];
C = [C;cdlist(:,2)];                      % stack up the highpass part
[C,ap] = wave(cdlist(:,1),hg,N,C,J-1,ap); % recursively compute the next level