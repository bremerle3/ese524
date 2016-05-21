% Make a plot illustrating duality
% Copyright 1999 by Todd K. Moon

lambda = -4:.05:4;
g = -(1-3.*lambda).^2/8 - (6 + 2.* lambda).^2/4 + lambda;
clf
subplot(3,3,1)
plot(lambda,g)
xlabel('\lambda')
ylabel('g(\lambda)')
axis([-4 4 -70 0])
print -dps ../pictures/duality1.ps
print -deps ../pictures/duality1.eps