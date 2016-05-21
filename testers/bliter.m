%
% test reconstruction of bandlimited function
% Copyright 1999 by Todd K. Moon

deltat = .02;
T = .5;
N = 1024;
Tmax = deltat*N/2;
deltaf = 1/(N*deltat);
b = floor(N*deltat/2+1);
f = zeros(N,1);
nsamp = T/deltat + 1;
tsamp = 0:deltat:T;
t = 0:deltat:Tmax;
ftrue = sinc(t);
g(1:nsamp) = sinc(tsamp);
g(N:-1:N-nsamp+2) = g(2:nsamp);
iter = 1;
numiter = 0;

bliter1;

subplot(2,2,1);
plot(t,ftrue,t,f(1:N/2+1),'--');
axis([0 10 -0.5 1]);
xlabel('t')
ylabel('f and fhat');
print -dps ../pictures/bliter1.ps
print -deps ../pictures/bliter1.eps
pause(1);
% text(5 ,-.875,'(a)','HorizontalAlignment','center');

clf; subplot(2,2,1);
%subplot(2,2,2);
F = fft(f,N);
plot(deltaf*(0:29),real(F(1:30)));
xlabel('f');
ylabel('F(f)');
print -dps ../pictures/bliter2.ps
print -deps ../pictures/bliter2.eps
pause(1);
% text(.75 ,-15,'(b)','HorizontalAlignment','center');

%$$$ subplot(2,2,3);
%$$$ plot(t,ftrue-f(1:N/2+1));