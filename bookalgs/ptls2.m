function [x] = ptls2(A,b,k1,k2)
% 
% Find the partial total least-squares solution to Ax = b,
% where k1 rows and k2 columns of A are unmodified
% 
% function [x] = ptls2(A,b,k1,k2)
%
% A = system matrix
% b = right-hand side
% k1 = number of rows of A not modified
% k2 = number of columns of A not modified
%
% x = PTLS solution to Ax=b

% Copyright 1999 by Todd K. Moon

T = [A -b];        % stack to form the Homogenous problem
W = T(1:k1,1:k2);      X = T(1:k1,k2+1:end);
Y = T(k1+1:end,1:k2);  Z = T(k1+1:end,k2+1:end);
% find the pieces of the transformed matrix
[u3,s3,v3] = svd(W);   rk11 = rank(W);
u3 = u3'; v3 = v3';
t = u3*X;
X2 = t(rk11+1:end,:);
[u4,s4,v4] = svd(X2);  rkx21 = rank(X2);
u4 = u4';  v4 = v4';
t = Y*v3';
Y2 = t(:,rk11+1:end);
[u5,s5,v5] = svd(Y2);  rky12 = rank(Y2);
u5=u5'; v5 = v5';
% build the transformation matrix
U1 = diagstack(eye(rk11),u4)*u3;  U2 = u5;
V1 = diagstack(eye(rk11),v5)*v3;  V2 = v4;
U = diagstack(U1,U2);   V = diagstack(V1,V2);
T1 = U*T*V';
W11 = T1(1:rk11,1:rk11);
X12 = T1(1:rk11,k2+rkx21+1:end);
Y21 = T1(k1+1+rky12:end, 1:rk11);
Z22 = T1(k1+rky12+1:end, k2+rkx21+1:end);
% make Z22-Y21*inv(W11)*X12 have a non-trivial nullspace
if(rk11)
  t = Z22 - Y21*inv(W11)*X12;
else
  t = Z22;
end
[uz,sz,vz] = svd(t);
r = rank(sz);
[mz22,nz22] = size(Z22);
if(nz22-r > 0)  % already has a nullspace
  Z22hat = Z22;
else
  if(r > 1)
   sz(1:r-1,1:r-1) = 0; deltaz22 = -uz*sz*vz';
   Z22hat = Z22 + deltaz22;
  else
  error('Too many constraints\n');
  end
end
T1(k1+rky12+1:end, k2+rkx21+1:end) = Z22hat;
% transform back
T1new = U'*T1*V;
Wnew = T1new(1:k1,1:k2);  Xnew = T1new(1:k1,k2+1:end);
Ynew = T1new(k1+1:end,1:k2);  Znew = T1new(k1+1:end,k2+1:end);
T = -Ynew*pinv(Wnew)*Xnew + Znew;
% find the smallest vector in the nullspace of T with last component=1
Vtilde = null(T);
if(all(Vtilde(end,:)==0))
  error('no solution');
end
v = makehouse(Vtilde(end,:));  Q = qrmakeq(v);
x2 = Vtilde*Q(:,1);
x2 = x2/x2(end);            % make the last component = 1
x1 = -pinv(Wnew)*Xnew*x2;   % determine the first part of the solution
x = [x1;x2(1:end-1)];       % stack up the answer