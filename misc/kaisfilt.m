% test the design of a Kaiser filter
% Copyright 1999 by Todd K. Moon

L = 5;
% see [717], p. 65 and DSP (Opp. & Schafer), p. 455
op = pi/L;
os = op+.1;
%oc = (op+os)/2;
oc = op;
delta = .001;

A = -20*log10(delta);
delo = os - op;
beta = .1102*(A-8.7);     % if A>50
M = floor((A-8)/(2.285*delo)+1);
alpha = M/2;

n = 0:M;

h = sinc(oc/pi*(n - alpha));   % sinc has the pi already in it
h = h .* besseli(0, beta*sqrt(1-((n-alpha)/alpha).^2))/besseli(0,beta);

t = 0:6
f = sin(pi*t/4);
fl = [];
newt = [];
for j=1:length(t)
  fl(L*(j-1)+1) = f(j);
  newt(j) = 115+(j-1)*L;
end
y = conv(fl,h);
yp = y(alpha-20:alpha+50);
 
subplot(2,2,1)
stem(t,f);
xlabel('\itn');
ylabel('\itx[\itn]');

subplot(2,2,2)
stem(0:length(fl)-1,fl);
xlabel('\itn');
ylabel('\ity[\itn]');

[H,w] = freqz(h,1);
subplot(2,2,3);
plot(w,20*log10(abs(H)));
axis([0 pi -150 50]);
xlabel('\Omega');
ylabel('|\itH(\ite^{j\Omega})| (dB)')

subplot(2,2,4)
yp = y(alpha-20:alpha+60);
plot((alpha-20:alpha+60) - newt(1),yp,newt-newt(1),f,'o');
axis([-20 60 -1.5 1.5]);
xlabel('\itn - 114');
ylabel('\itz[\itn]');
print -dps ../pictures/filtinterp.ps