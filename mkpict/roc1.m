% plot the roc for a gaussian r.v.
% Copyright 1999 by Todd K. Moon

% first plot the Q function
subplot(2,2,1);
x = 0:.1:6;
semilogy(x,qf(x));
xlabel('x');
ylabel('Q(x)')
axis square
print -dps ../pictures/qf.ps
print -deps ../pictures/qf.eps


%$$$ clf
%$$$ subplot(2,2,1)
%$$$ plot([0 1],[0 1]); hold on;
%$$$ for d = 1:3       % sigma = 1, and vary d
%$$$   s = sprintf('d=%d',d);
%$$$   Pd = [1];
%$$$   Pfa = [1];
%$$$   for nu = .1:.1:10
%$$$    Pfa = [Pfa; qf( log(nu)/d + d/2)];
%$$$    Pd =  [Pd; qf( log(nu)/d - d/2)];
%$$$   end
%$$$   Pd = [Pd; 0];
%$$$   Pfa = [Pfa; 0];
%$$$   plot(Pfa,Pd);
%$$$ 
%$$$   hold on
%$$$ end
%$$$ axis equal
%$$$ axis([0 1 0 1])
%$$$ xlabel('P_{FA}')
%$$$ ylabel('P_{D}')
%$$$ print -dps ../pictures/roc1.ps
%$$$ % now edit with xfig: pstoedit -f fig roc1.ps roc1.fig