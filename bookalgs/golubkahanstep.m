function [B,U,V] = golubkahanstep(B,Uin,Vin)
% 
% Given a bidiagonal matrix B with NO zeros on the diagonal or
% superdiagonal, create a new B <-- U'BV, using an implicit QR shift on
% T = B'B
%
% function [B,U,V] = golubkahanstep(B,Uin,Vin)
%
% B = bidiagonal matrix
% Uin, Vin = last estimate of U and V
%
% B = new bidiagonal matrix
% U, V = new estimate of U and V

% Copyright 1999 by Todd K. Moon

[n,n] = size(B);
T = B(:,n-1:n)'*B(:,n-1:n);  % get the lower right 2x2 matrix
d = (T(1,1) - T(2,2))/2;
% The initial shift is Wilkinson's shift (eigval. of lower right 2x2)
tau = T(2,2)  +  d - sign(d)*sqrt(d^2 + T(2,1)^2);
y = B(1,1)^2 - tau;  z = B(1,1)*B(1,2); % shifted values
if(nargin==1)
  U = eye(n);  V = eye(n);
else
  U = Uin;     V = Vin;
end
for k=1:n-1
  [c,s] = qrtheta(y,z);         % find the Givens rotation
  if(nargout>1) 
  V(:,[k,k+1]) = [c*V(:,k)-s*V(:,k+1),s*V(:,k)+c*V(:,k+1)];
  end
  % compute BG'
  B(:,k:k+1) = [c*B(:,k) - s*B(:,k+1), s*B(:,k) + c*B(:,k+1)];
  y = B(k,k);  z = B(k+1,k);
  [c,s] = qrtheta(y,z);         % find the Givens rotation
  % compute GB
  B(k:k+1,:) = [c*B(k,:) - s*B(k+1,:); s*B(k,:) + c*B(k+1,:)];
  if(nargout>1) 
  U(:,[k,k+1]) = [c*U(:,k)-s*U(:,k+1),s*U(:,k)+c*U(:,k+1)];
  end
  if(k< n-1)                            % values to use for next Givens
  y = B(k,k+1);
  z = B(k,k+2);
  end
end