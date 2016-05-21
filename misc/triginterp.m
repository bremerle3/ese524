% demonstrate trigonometric interpolation
% Copyright 1999 by Todd K. Moon

clear i;
N = 6;
t=0:(N-1);
f = t.^2;
beta = fft(f)/N
expt = exp(i*2*pi*t/N);
betar = fliplr(beta)
r = real(polyval(betar,expt))
ts = 0:.05:(N-1)
expts = exp(i*2*pi*ts/N);
figure(1);
subplot(2,2,1);
plot(t,r,'o',ts,real(polyval(betar,expts)))
axis([0 N-1 0 (N-1)^2+1]);
xlabel('\itt');
ylabel('\itf(\itt)');

subplot(2,2,2);
ts2 = 0:.05:2*(N-1);
expts2 = exp(i*2*pi*ts2/N);
plot(t,r,'o',ts2,real(polyval(betar,expts2)))
xlabel('\itt');
ylabel('\itf(\itt)');


