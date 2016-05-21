% Copyright 1999 by Todd K. Moon
clf
subplot(2,2,1)
plot(lpv);
xlabel('iterations')
ylabel('log likelihood')
% axis([1 4 -25 -5])
print -dps ../pictures/hmmconv.ps
print -deps ../pictures/hmmconv.eps