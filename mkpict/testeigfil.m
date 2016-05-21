% Test the eigenfilter stuff
% Copyright 1999 by Todd K. Moon

Nplot = 256 ;
wp = 0.2;
ws = 0.25;
N = 45;
alpha = 0.2;
h1 = eigfil(wp*pi,ws*pi,N,alpha);
[mh1,w] = freqz(h1,1,Nplot);
mh1 = mh1/mh1(1);

alpha = 0.8;
h2 = eigfil(wp*pi,ws*pi,N,alpha);
[mh2,w] = freqz(h2,1,Nplot);
mh2 = mh2/mh2(1);

f = [0 wp ws 1];
a = [1 1 0 0];
hremez = remez(N-1,f,a);
 
hold on
[mh3,w] = freqz(hremez,1,Nplot);
mh3 = mh3/mh3(1);
% 
subplot(2,1,1)
plot(w/pi,20*log(abs(mh1)),w/pi,20*log(abs(mh2)),':',w/pi,20*log(abs(mh3)),'-.')
xlabel('Normalized frequency')
ylabel('Magnitude response (dB)')
legend('\alpha=0.2','\alpha=0.8','Remez')
print -dps ../pictures/testeigf1.ps
print -deps ../pictures/testeigf1.eps