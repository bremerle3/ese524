function [B] = qrqtbgiv(B,thetac,thetas)
% 
% Given thetac and thetas containing rotation parameters from Givens rotations,
% (produced using qrqrgivens), compute Q^H B, where Q is formed (implicitly)
% from the rotations in Theta.
%
% function [B] = qrqtbgiv(B,thetac,thetas)
%
% B = matrix to be opererated on
% thetac = cosine component of rotations from Givens rotations
% thetas = sine component of rotations from Givens rotations
%
% Output: B <-- Q^H B

% Copyright 1999 by Todd K. Moon

[m,n] = size(thetac);
for k=1:n
  for i=m:-1:k+1
    c = thetac(i,k); s = thetas(i,k);
    % apply the givens rotation to rows (i-1) and i of B
    B(i-1:i,:) = [c*B(i-1,:) - s*B(i,:); s*B(i-1,:) + c*B(i,:)];
  end
end