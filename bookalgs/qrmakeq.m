function Q = qrmakeq(V)
% 
% Convert the V matrix returned by qrhouse into a Q matrix
% 
% function Q = qrmakeq(V)
%
% V = [v1 v2 .... vr], Householder vectors produced by qrhouse
%
% Q = [Q1 Q2 ... Qr], the orthogonal matrix in the QR factorization

% Copyright 1999 by Todd K. Moon

[n,r] = size(V);
Q = eye(n);
for j=r:-1:1
  v = V(:,j);
  Q = houseleft(Q,v);
end