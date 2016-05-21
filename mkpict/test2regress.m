% Test the formulas for regression in two dimensions
% input: x and y vectors
% Copyright 1999 by Todd K. Moon

x = 0:10
n = length(x);
y = 3*x + 2 + 3*randn(1,n)
clf
subplot(2,2,1)
plot(x,y,'o')
xlabel('x')
ylabel('y')
print -dps ../pictures/regress1.ps
print -deps ../pictures/regress1.eps

xy = x .* y;
sxy = sum(xy);
sx = sum(x);
sy = sum(y);
sx2 = sum(x .^2);
a = (n*sxy - sx*sy)/(n*sx2 - sx^2);
b = (sx2*sy - sx*sxy)/(n*sx2 - sx^2);
p = [a b];
pv = polyval(p,x);
hold on
plot(x,pv)
for i=1:n
  line([x(i) x(i)],[pv(i) y(i)])
end
print -dps ../pictures/regress2.ps
print -deps ../pictures/regress2.eps

