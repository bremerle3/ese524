function h = eigfilcon0new(wp,ws,N,alpha, Wo)
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
% find a basis for nullspace of C':
X = null(C');
% [v,d] = eig(X'*R*X,X'*X);
 [v,d] = eig((X'*X)\X'*R*X);
[n,m] = size(d);
diag(d)'
[dmin,idx] = min(diag(d));
%subplot(2,2,3) 
%plot(real(diag(d)));

mlist = 1:M;
bbest = X*v(:,idx);     % corresponding to the smallest eigenvalu
b = bbest;
C'*b
h(M-mlist+1,1) = b(mlist+1)/2;  h(M+mlist+1) = b(mlist+1)/2;
h(M+1) = b(1);

[dmax,idx] = max(diag(d));
bworst = X*v(:,idx);
hworst(M-mlist+1,1) = bworst(mlist+1)/2;  hworst(M+mlist+1) = bworst(mlist+1)/2;
hworst(M+1) = bworst(1);

[mh1,w] = fz(hworst,1,256);
mh1 = mh1/mh1(1);
subplot(2,2,4)
plot(w/pi,abs(mh1));
