% test the linear programming filter design
% Copyright 1999 by Todd K. Moon

n=45;
[h,delta ] = lpfilt(0.1, 0.12, n);

[H,w] = freqz(h,1,256);
subplot(2,2,1)
plot(w/(2*pi),20*log10(abs(H)));
axis([0 .5 -80 10])
xlabel('frequency (0.5=Nyquist)')
ylabel('Magnitude (dB)');


subplot(2,2,2)
stem(0:n-1,h);
xlabel('n');
ylabel('h[n]');
axis([0 45 -.1 .3])

print -dps ../pictures/lpfilt.ps
print -deps ../pictures/lpfilt.eps