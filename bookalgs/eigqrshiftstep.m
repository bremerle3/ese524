function [T,Q] = eigqrshiftstep(T,Qin)
% 
% Perform the implicit QR shift on T, where the shift
% is obtained by the eigenvalue of the lower-right 2x2 submatrix of T
%
% function [T,Q] = eigqrshiftstep(T,Qin)
% 
% T = tridiagonal matrix
% Qin = (optional) orthogonal input matrix
%
% T = T matrix after QR shift
% Q = (optional) orthogonal matrix

% Copyright 1999 by Todd K. Moon

[m,n] = size(T);
d = (T(m-1,m-1) - T(m,m))/2;
% The initial shift is Wilkinson's shift (eigval. of lower right 2x2)
tau = T(m,m)  +  d - sign(d)*sqrt(d^2 + T(m,m-1)^2);
x = T(1,1) - tau;  z = T(2,1);          % shifted values
if(nargin==1)
  Q = eye(m);
else
  Q = Qin;
end
for k=1:m-1
  [c,s] = qrtheta(x,z);                 % find the Givens rotation
  if(nargout==2)                        % rotate
    Q(:,[k,k+1]) = [c*Q(:,k)-s*Q(:,k+1),s*Q(:,k)+c*Q(:,k+1)];
  end
  % compute GA
  T(k:k+1,:) = [c*T(k,:) - s*T(k+1,:); s*T(k,:) + c*T(k+1,:)];

  % compute AG'
  T(:,k:k+1) = [c*T(:,k) - s*T(:,k+1), s*T(:,k) + c*T(:,k+1)];
  if(k< m-1)                            % values to use for next Givens
    x = T(k+1,k);
    z = T(k+2,k);
  end
end