% test the rls in an equalizer setting
% Assume a binary +/- 1 input.
% Copyright 1999 by Todd K. Moon

ntaps = 11;             % number of adaptive filter taps
nvals = 1:3;
W = 2.9;
trueh = [.2 .3 .4,-.3,-.2];
lh = length(trueh);

noisevar = 0.001;

% compute the true autocorrelation
Rtrue = zeros(ntaps,ntaps);
lconv = conv(trueh,fliplr(trueh));
r = lconv(lh:length(lconv));
r(1) = r(1)/2;
for i=1:ntaps
  Rtrue(i,i:i+min(lh,ntaps-i+1)-1) = r(1:min(lh,ntaps-i+1));
end
Rtrue = Rtrue + Rtrue' + eye(ntaps)*noisevar
l = eig(Rtrue);
r = l(ntaps)/l(1)
sampout = 7;
rinv = inv(Rtrue);
p = [zeros(sampout-3,1); fliplr(trueh)'; zeros(ntaps-lh-sampout+3,1)];
hopt = rinv*p;
emin = 1-p'*hopt;

trueh = trueh';
global xrls;
global hrls;
xin = zeros(lh,1);
x = zeros(ntaps,1);
sig = sqrt(noisevar);

nsamp = 100;
navg = 200;

erls = zeros(1,nsamp);
erlsavg = zeros(1,nsamp);

for nav = 1:navg
  rlsinit(ntaps,.01);
  xin = 0*xin;
  x = 0*x;
  nav
  for k= 1:nsamp
	bit = 2*(rand(1,1)>.5)-1;
	xin = [bit;xin(1:length(xin)-1)];
    x = [bit;x(1:length(x)-1)];
    fout = xin'*trueh;
	savef(k) = fout;
	xchannel = fout + randn(1,1)*sig;
	d = x(sampout);
	[hestrls,eaprls] = rls(xchannel,d);
	erls(k) = eaprls;
  end
  erlsavg = erlsavg + erls.^2;
end
erlsavg = erlsavg/navg;

clf
subplot(2,2,1);
stem(hopt);
xlabel('k');
ylabel('h_{opt}[k]');

semilogy(sampout:length(erlsavg),erlsavg(sampout:length(erlsavg)),...
    sampout:length(erlsavg),emin)
xlabel('number of iterations');
ylabel('Ensemble-averaged square error');
print -dps ../pictures/rls1err.ps
print -deps ../pictures/rls1err.eps

stem(hestrls)
xlabel('k');
ylabel('h_{rls}[k]');
