function h = eigfilcon(wp,ws,N,alpha, Wo, d)
%
% Design an eigenfilter with values constrained at some frequencies
%
% function h = eigfilcon(wp,ws,N,alpha, Wo, d)
%
% wp = passband frequency
% ws = stopband frequency
% m = number of coefficients (must be ODD)
% alpha = tradeoff parameter between stopband and passband
% Wo = list of constraint frequencies
% d = desired magnitude values at those frequencies
%
% h = filter coefficients

% Copyright 1999 by Todd K. Moon

M = (N-1)/2; p2 = pi/2;  Wo = Wo(:);  d = d(:);
mlist=(0:M)';
C = zeros(M+1,length(Wo));
for i=1:length(Wo)
  C(:,i) = cos(mlist*Wo(i));
end

[P,Q] = eigmakePQ(wp,ws,N);             % make the P and Q matrices
R = alpha*P + (1-alpha)*Q;
Ri = inv(R);
b = Ri*C*inv(C'*Ri*C)*d;                % solve the constrained problem
mlist = 1:M;
h(M-mlist+1,1) = b(mlist+1)/2;  h(M+mlist+1) = b(mlist+1)/2;
h(M+1) = b(1);                          % place into filter coefficients