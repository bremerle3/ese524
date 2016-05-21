function [A,B,C] = sysidsvd2(h,order)
% 
% given a sequence of impulse responses in h (a cell array)
% identify a system (A,B,C)
% This uses the tohankel method of finding a nearest hankel matrix
% of desired rank
%
% function [A,B,C] = sysidsvd(h,order)
%
% h = impulse response sequence (cell array)
% order = desired order of system
%
% (A,B,C) = system

% Copyright 1999 by Todd K. Moon

[l,k] = size(h);
[m,l] = size(h{1});
H = makehankel([h{1:k}],floor(k/2),floor(k/2)+1);
[H,d] = tohankelbig(H,order,m);   % find nearest Hankel of given order
h = fromhankel2(H,m);             % get the sequence back
p = order;
H = makehankel([h{1:k-1}],floor(k/2),floor(k/2));

Hshift = makehankel([h{2:k}],floor(k/2),floor(k/2));
[u,s,v] = svd(Hshift);
% fprintf(1,'s=%g ',diag(s));
[U,S,V] = svd(H);
P = U';
Q = V*pinv(S);
temp = (P*H);
B = temp(1:p,1:l);
temp = H*Q;
C = temp(1:m,1:p);
temp = (P*Hshift*Q);
A = temp(1:p,1:p);