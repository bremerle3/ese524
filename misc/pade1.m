% Pade example
% Copyright 1999 by Todd K. Moon

m = 3;   % degree of numerator
k= 3;    % degree of denominator
x = -1:.1:1;
N = m+k;
c = [];
for j=0:N
  c(j+1) = 1/fact(j);
end

[A33,B33] = padefunct(c,m,k);
num = polyval(A33,x);
den = polyval(B33,x);
ap = num ./ den;
clg
subplot(2,2,1); 
semilogy(x,abs(exp(x)-ap));

 
k=2;
[A32,B32] = padefunct(c,m,k);
num = polyval(A32,x);
den = polyval(B32,x);
ap = num ./ den;
%subplot(2,2,2);
hold on
semilogy(x,abs(exp(x)-ap),'--');
xlabel('x');
ylabel('|Rmk(x) - exp(x)|');

k=1;
[A31,B31] = padefunct(c,m,k);
num = polyval(A31,x);
den = polyval(B31,x);
ap = num ./ den;
%subplot(2,2,2);
semilogy(x,abs(exp(x)-ap),'-.');

k=0;
[A30,B30] = padefunct(c,m,k);
num = polyval(A30,x);
den = polyval(B30,x);
ap = num ./ den;
%subplot(2,2,4);
%hold on
semilogy(x,abs(exp(x)-ap),':');