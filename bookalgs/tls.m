function x = tls(A,b)
% 
% determine the total least-squares solution of Ax=b
%
% function x = tls(A,b)
%
% A = system matrix
% b = right-hand side
%
% x = TLS solution to Ax=b

% Copyright 1999 by Todd K. Moon

C = [A b];
[m,n] = size(C);  m1 = min(m,n);
[u,s,v] = svd(C)
% determine how many of the singular values are the same
for i=m1:-1:2
  i
  if(abs(s(i,i)-s(i-1,i-1)) > 1e-8)
    p = m1-i;
    break;
  end
end
Vtilde = v(:,n-p:n);       % nullspace
v = makehouse(Vtilde(end,:));
Q = qrmakeq(v);
Vtilde*Q
z = Vtilde*Q(:,1);
if(z(n))
  x = -z(1:n-1)/z(n)
else
  error('No TLS solution');
end