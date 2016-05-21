function [P,Q] = eigmakePQ(wp,ws,m)
%
% Make the P and Q matrices for eigenfiltering
%
% function [P,Q] = eigmakePQ(wp,ws,N)
%
% wp = passband frequency
% ws = stopband frequency
% N = number of coefficients

% Copyright 1999 by Todd K. Moon
% and thanks to David Willis, Oregon Instutute of Technology

N=m-1;  M = N/2;  p2 = pi/2;
mlist=1:M;
P = diag([1-ws/pi,(p2-ws/2-sin(2*mlist*ws)./(4*mlist))/pi]);
Q = diag([0,(1.5*wp-2*sin(mlist*wp)./mlist+(sin(2*mlist*wp)./(4*mlist)))/pi]);
p2i = 1/(2*pi);
for m=1:M
  nlist = 0:m-1;  a=m-nlist;  b=m+nlist;
  P(m+1,nlist+1) = -p2i*(sin(a*ws)./a + sin(b*ws)./b);
  P(nlist+1,m+1) = P(m+1,nlist+1)';
  Q(m+1,nlist+1) = (wp/pi)*(1 - sinc(m*wp/pi) - sinc(nlist*wp/pi) ...
             + 0.5*sinc(a*wp/pi) + 0.5*sinc(b*wp/pi));
  Q(nlist+1,m+1) = Q(m+1,nlist+1)';      
end