function h = eigfil(wp,ws,m,alpha)
%
% Design an eigenfilter
% 
% function h = eigfil(wp,ws,m,alpha)
%
% wp = passband frequency
% ws = stopband frequency
% m = number of coefficients (must be ODD)
% alpha = tradeoff parameter between stopband and passband
%
% h = filter coefficients

% Copyright 1999 by Todd K. Moon

M = (m-1)/2;   p2 = pi/2;
[P,Q] = eigmakePQ(wp,ws,m);      % make the P and Q matrices
R = alpha*P + (1-alpha)*Q;       % combine together
[V,D] = eig(R);
[y,i] = min(abs(diag(D)));       % find minimum eigenvalue
b = V(:,i);
mlist = 1:M;
h(M-mlist+1,1) = b(mlist+1)/2;  h(M+mlist+1) = b(mlist+1)/2;
h(M+1) = b(1);                   % place into filter coefficients