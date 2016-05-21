function [a,b] = kissarma(y,p)
% 
% Determine the ARMA parameters a and b of order p based upon the data in y.
%
% function [a,b] = kissarma(y,p)
%
% y = sequence 
% p = order of AR part
%
% a = AR coefficients
% b = MA coefficients

% Copyright 1999 by Todd K. Moon

y = y(:);                   % convert to columns
n = length(y);
e = zeros(p+1,1);  
e(p+1) = 1;                 % vector with one 1
Y = []; 
A = []; 
for i=1:n-p                 % build the data matrix
  Y = [Y y(i:p+i)];
end
a = [rand(p,1); 1];         % initial guess
while 1
  A = [];                   % build a new a
  for i=1:n-p
    A = [A [zeros(i-1,1); a; zeros(n-p-i,1)]];
  end
  Q = Y*inv(A'*A)*Y';
  newa = 1/(e'*inv(Q)*e) * inv(Q)*e
  if(norm(newa-a) < 1.e-5)
    a = newa; break;
  end
  a = newa;
end
% now find b
% first form K^{-1}
Ki = [];
for i=1:p
  Ki = [Ki; [a(p+2-i:p+1)' zeros(1,n-i)]];
end
for i=p+1:n
  Ki = [Ki; [zeros(1,i-(p+1)) a' zeros(1,n-i)]];
end
% Since we only need the first p columns of K, partition
% and use matrix inversion formula
K11 = Ki(1:p,1:p);    K12 = Ki(1:p,p+1:n);
K21 = Ki(p+1:n,1:p);  K22 = Ki(p+1:n,p+1:n);
K11i = inv(K11);   K22i = inv(K22);
E = K11 - K12*K22i*K21;    H = K22 - K21*K11i*K12;  G = -K21*K11i;
H = [inv(E); inv(H)*G];

b = pinv(H)*y;