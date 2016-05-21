function Q = qrmakeqgiv(thetac,thetas)
% 
% Given thetac and thetas containing rotation parameters from Givens rotations,
% (produced using qrqrgivens), compute Q
% function Q = qrmakeqgiv(thetac,thetas)
% 
% thetac = cosine component of Givens rotation
% thetas = sin component of Givens rotation
%
% Q = orthogonal matrix formed by Givens rotations

% Copyright 1999 by Todd K. Moon

[m,n] = size(thetac);
Q = eye(m);
for k=1:n
  for i=m:-1:k+1
    c = thetac(i,k); s = thetas(i,k);
    Q(:,[i-1,i]) = [c*Q(:,i-1)-s*Q(:,i), s*Q(:,i-1)+c*Q(:,i)];
  end
end