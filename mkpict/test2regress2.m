% Test the formulas for regression in two dimensions
% input: x and y vectors
% Copyright 1999 by Todd K. Moon

x = [1 3 6 5 3]
y = [2.5 3.5 6 3 4]
n = length(x);
clf
subplot(2,2,1)
plot(x(1:3),y(1:3),'yx')
hold on
plot(x(4:5),y(4:5),'yo')
xlabel('x')
ylabel('y')

X = [x' ones(n,1)];
W = eye(n);
W(1,1) = 10;  W(2,2) = 10;  W(3,3) = 10;
c = inv(X'*W*X)* X'*W*y'
pvw = polyval(c,x);

xy = x .* y;
sxy = sum(xy);
sx = sum(x);
sy = sum(y);
sx2 = sum(x .^2);
sy2 = sum(y .^2);
a = (n*sxy - sx*sy)/(n*sx2 - sx^2);
b = (sx2*sy - sx*sxy)/(n*sx2 - sx^2);
p = [a b];
pv = polyval(p,x);
hold on
plot(x,pvw,'-',x,pv,':')
legend('-','weighted least-squares',':','least-squares')
%$$$ for i=1:n
%$$$   line([x(i) x(i)],[pv(i) y(i)])
%$$$ end

% print after adjusting the legend
% print -dps ../pictures/regress3.ps
% print -deps ../pictures/regress3.eps

