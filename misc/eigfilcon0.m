function h = eigfilcon0(wp,ws,N,alpha, Wo)
%
% Find eigenilter constrained so that response is 0 at some frequencies
%
% function h = eigfilcon(wp,ws,N,alpha, Wo)
%
% wp = passband frequency
% ws = stopband frequency
% m = number of coefficients (must be ODD)
% alpha = tradeoff parameter between stopband and passband
% Wo = list of constraint frequencies at which response is 0
%
% h = filter coefficients

% Copyright 1999 by Todd K. Moon

M = (N-1)/2; p2 = pi/2;  Wo = Wo(:);
r = length(Wo); mlist=(0:M)';
C = zeros(M+1,length(Wo));
for i=1:length(Wo)
  C(:,i) = cos(mlist*Wo(i));
end

[P,Q] = eigmakePQ(wp,ws,N);
R = alpha*P + (1-alpha)*Q;
P = eye(M+1) -C*inv(C'*C)*C'
K = P*R*P;
% deflate K  see [454]
[Q,RS,E] = qr(K);
Q = Q';  E = E';
J = [0 zeros(1,M+1-r); zeros(M+1-r,1) eye(M+1-r)];
G22 = J*Q*K*Q'*J;
G22 = G22(r+1:end,r+1:end);
[Z,lambda] = eig(G22);
mind = inf; 
clf;  Nplot = 256;
for i=1:M+1-r
  z = G22(:,i);
  x = Q'*[zeros(r,M+1-r); eye(M+1-r)]*z;
  x = x/norm(x);
  d = x'*R*x;
  h(M-mlist+1,1) = x(mlist+1)/2;  h(M+mlist+1) = x(mlist+1)/2;
  h(M+1) = x(1);
  [mh1,w] = fz(h,1,Nplot);
  plot(w/pi,abs(mh1));
  pause(2)
  clf
  if(d < mind)
    fprintf(1,'i=%d\n',i)
    mind = d;
    b = x;
  end
end
b = b/norm(b);
mlist = 1:M;
h(M-mlist+1,1) = b(mlist+1)/2;  h(M+mlist+1) = b(mlist+1)/2;
h(M+1) = b(1);