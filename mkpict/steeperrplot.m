% Make plots of error for steepest descent
% Copyright 1999 by Todd K. Moon


clf;
subplot(2,2,1);
mu=0.004;
steeperr;
%text(10,-13.75,'(a)','HorizontalAlignment','center');
print -dps ../pictures/steepest2a.ps
print -deps ../pictures/steepest2a.eps
input('press return')

clf
subplot(2,2,1);
mu=0.0051;
steeperr;
print -dps ../pictures/steepest2b.ps
print -deps ../pictures/steepest2b.eps
%text(10,-30,'(b)','HorizontalAlignment','center');
