% test the eigenfilter stuff
% Copyright 1999 by Todd K. Moon

Nplot = 256 ;
wp = 0.2;
ws = 0.25;
N = 65;
alpha = 0.999;
% W0 =  [.25*pi 0.5*pi]';
W0 =  [0.1*pi]';
h1 = eigfilcon0new(wp*pi,ws*pi,N,alpha,W0);

[mh1,w] = fz(h1,1,Nplot);
mh1 = mh1/mh1(1);

h2 = eigfil(wp*pi,ws*pi,N,alpha);
[mh2,w] = fz(h2,1,Nplot);
mh2 = mh2/mh2(1);
%$$$ subplot(2,2,1)
%$$$ plot(w/pi,abs(mh1),w/pi,abs(mh2),':') %,w/pi,20*log(abs(mh3)),'-.')
%$$$ xlabel('Normalized frequency (F_s/2=1)')
%$$$ ylabel('Magnitude response')
% 
% print -dps ../pictures/testeigf3a.ps
clf
subplot(2,2,1) 
plot(w/pi,20*log(abs(mh1)),w/pi,20*log(abs(mh2)),':')% %,w/pi,20*log(abs(mh3)),'-.') 
xlabel('Normalized frequency (F_s/2=1)')
ylabel('Magnitude response (dB)')
%print -dps ../pictures/testeigf3.ps
print -dps ../pictures/testeigf3a.ps
 
