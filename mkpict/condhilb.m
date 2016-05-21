% Plot the condition of the Hilbert matrix
% Copyright 1999 by Todd K. Moon

n = 2:12';
c = [];
for i=n
  H = hilb(i);
  c = [c;cond(H)];
end

subplot(3,3,1);
semilogy(n,c);
axis([2,12,1,10^20])
xlabel('m')
ylabel('cond(H_m)')
set(gca,'XTick',[2,4,6,8,10,12])
print -dps ../pictures/condhilb.ps
print -deps ../pictures/condhilb.eps