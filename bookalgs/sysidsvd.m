function [A,B,C] = sysidsvd(h,tol,ord)
% 
% given a sequence of impulse responses in h
% identify a system (A,B,C)
%
% function [A,B,C] = sysidsvd(h,tol)
% h = impulse responses (a cell array)
% tol = (optional) tolerance used in rank determination
% ord = system order (overrides tolerance)
%
% (A,B,C) = estimated system matrix parameters

% Copyright 1999 by Todd K. Moon

if(nargin==1) tol = 1e-4;  end
[l,k] = size(h);
[m,l] = size(h{1});
H = makehankel([h{1:k-1}],floor(k/2),floor(k/2));
Hshift = makehankel([h{2:k}],floor(k/2),floor(k/2));
[u,s,v] = svd(Hshift);
if(nargin==3)
  p = ord;
else
  p = rank(H,tol);             % allow some slack on the rank
  fprintf(1,'system order identified=%d\n',p);
end
[U,S,V] = svd(H);
P = U';
Q = V*pinv(S);
temp = (P*H);
B = temp(1:p,1:l);
temp = H*Q;
C = temp(1:m,1:p);
temp = (P*Hshift*Q);
A = temp(1:p,1:p);