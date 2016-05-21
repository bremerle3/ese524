% Bayes decision tests for Gaussian

% Copyright 1999 by Todd K. Moon

p = .01:.01:.99;
pl = 0:.01:1;
clf;
subplot(2,2,1)
for d=1:3
  P = (1-p).* qf(1/d*log((1-p)./ p)+d/2) + p.*qf(d/2 - 1/d*log((1-p) ./ p));
  Pl = [0 P 0];
  plot(pl,Pl);
  s = sprintf('SNR=%d',d);
  text(.45,P(50)+.02,s);
  hold on;
end
xlabel('p')
ylabel('r(p,\phi)')
print -dps ../pictures/bayes2.ps
print -deps ../pictures/bayes2.eps