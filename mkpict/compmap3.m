% make figure comppos1
% Copyright 1999 by Todd K. Moon

compmap2  % run the data
% get the old data to plot
oldx = [h; zeros(N-2*q-1,1); h(q+1:-1:2)];  % Conjugate even extension
Xold = fft(oldx);

clf
subplot(2,2,1);
plot((0:N/2-1)/N,X(1:N/2));
axis([0 0.5 -2 12]);
hold on 
plot((0:N/2 - 1)/N,real(Xold(1:N/2)),'--');
xlabel('Normalized frequency')
ylabel('X(f)')
% text(.25,-5.2,'(a)','HorizontalAlignment','center');
print -dps ../pictures/comppos1a.ps
print -deps ../pictures/comppos1a.eps

clf
subplot(2,2,1);
plot(t,h);
axis([0 10 0 1.2])
hold
plot(t,x(1:q+1))
xlabel('k');
ylabel('x[k]');
%text(5,-.28,'(b)','HorizontalAlignment','center');
print -dps ../pictures/comppos1b.ps
print -deps ../pictures/comppos1b.eps