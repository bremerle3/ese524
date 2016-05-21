% Test the eigenfilter stuff
% Copyright 1999 by Todd K. Moon

Nplot = 256 ;
wp = 0.2*pi;
ws = 0.25*pi;
N = 45;
alpha = 0.2;
W0 =  [0 0.4*pi .5*pi .8*pi]';
d = [1 1 0 0]';

%$$$ W0 =  [0 0.1*pi .5*pi .8*pi]';
%$$$ d = [1 0 1 0]';

h1 = eigfilcon(wp,ws,N,alpha,W0,d);
[mh1,w] = freqz(h1,1,Nplot);
mh1 = mh1 / mh1(1);

h2 = eigfil(wp,ws,N,alpha)
[mh2,w] = freqz(h2,1,Nplot);
mh2 = mh2/mh2(1);

subplot(2,2,1)
plot(w/pi,abs(mh1),w/pi,abs(mh2),':') %,w/pi,20*log(abs(mh3)),'-.')
xlabel('Normalized frequency (1=F_s/2)')
ylabel('Magnitude response')
pause(2)
print -dps ../pictures/testeigf2a.ps
print -deps ../pictures/testeigf2a.eps
%print -dps ../pictures/testeigf2ax.ps
plot(w/pi,20*log(abs(mh1)),w/pi,20*log(abs(mh2)),':')% %,w/pi,20*log(abs(mh3)),'-.') 
xlabel('Normalized frequency (1=F_s/2)')
ylabel('Magnitude response (dB)')
print -dps ../pictures/testeigf2b.ps
print -deps ../pictures/testeigf2b.eps
%print -dps ../pictures/testeigf2bx.ps
return
alpha = 0.8;
h2 = eigfil(wp,ws,N,alpha);
[mh2,w] = freqz(h2,1,Nplot);

f = [0 wp/pi ws/pi 1];
a = [1 1 0 0];
hremez = remez(N-1,f,a);
 
hold on
[mh3,w] = freqz(hremez,1,Nplot);
subplot(2,1,1)
xlabel('Normalized frequency')
ylabel('Magnitude response (dB)')
print -dps ../pictures/testeigf1.ps
print -deps ../pictures/testeigf1.eps

