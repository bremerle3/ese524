% Test the fblp AR estimator
% Copyright 1999 by Todd K. Moon

j = sqrt(-1);
r = [.9*exp(j*.25*pi) .9*exp(j*.5*pi)];
%r = .8
a1 = poly(r)';
a = -a1(2:end);
clf
figure(1)
subplot(3,2,1);
sigma = .01;
[w,h] = psdarma(sigma,a1);
hav = zeros(size(h));
ntrial = 10;
%freqz(1,a1);
for i=1:ntrial
  x = genardat(a,sigma,20);
  [ahat,sigmaest] = fblp(x,2);
  %figure(2)
  %freqz(1,[1;-ahat])
  subplot(3,2,3)
  hold on
  [w,h] = psdarma(sigmaest,[1;-ahat]);
  hav = hav + h;
end
h = hav/ntrial;
subplot(3,2,5)
plot(w/pi,20*log10(h));
xlabel('normalized frequency (Nyquist==1)')
ylabel('Magnitude (dB)');
print -deps ../pictures/fblp.ps