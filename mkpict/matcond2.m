% Set up an ill-conditioned matrix of sinusoids
% Copyright 1999 by Todd K. Moon

% set up before calling:
% maxN
% deltaf
% fmax

clear n;
clear c;
for k=1:maxN
   N = k;
   matcond
   n(k) = k;
   c(k) = cond(f);
end

subplot(3,3,1)
semilogy(n,c);
xlabel('N')
ylabel('\kappa(A_N)');
print -dps ../pictures/matcond.ps
print -deps ../pictures/matcond.eps
