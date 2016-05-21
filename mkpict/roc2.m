% plot the roc for a a xi^2
% Copyright 1999 by Todd K. Moon

clf
subplot(2,2,1)
Pfa = 0:.05:1;
for s0s1=1:5
  Pd = Pfa .^ (1/s0s1)
  plot(Pfa,Pd)
  hold on;
end
xlabel('P_{FA}')
ylabel('P_{D}')
print -dps ../pictures/roc2.ps
% now edit with xfig: pstoedit -f fig roc2.ps roc2.fig