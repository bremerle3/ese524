% test the lms in an equalizer setting
% Assume a binary +/- 1 input.
% Copyright 1999 by Todd K. Moon

ntaps = 11;             % number of adaptive filter taps
nvals = 1:3;
W = 2.9;
trueh = .5*(1+cos(2*pi/W*(nvals-2)));
lh = length(trueh);

% trueh = [.2 1 -.2];
noisevar = 0.001;
% compute the true autocorrelation
Rtrue = zeros(ntaps,ntaps);
lconv = conv(trueh,fliplr(trueh));
r = lconv(lh:end);
r(1) = r(1)/2;
for i=1:ntaps
  Rtrue(i,i:i+min(lh,ntaps-i+1)-1) = r(1:min(lh,ntaps-i+1));
end
Rtrue = Rtrue + Rtrue' + eye(ntaps)*noisevar
l = eig(Rtrue);
r = l(ntaps)/l(1)
sampout = 6;
rinv = inv(Rtrue);
p = [zeros(sampout-3,1); fliplr(trueh)'; zeros(ntaps-lh-sampout+3,1)];
hopt = rinv*p;
emin = 1-p'*hopt;

trueh = trueh';
global xrls;
global xlms;
global hlms;
global hrls;
xin = zeros(lh,1);
x = zeros(ntaps,1);
sig = sqrt(noisevar);

nsamp = 1000;
navg = 200;

erls = zeros(1,nsamp);
elms = zeros(1,nsamp);
erlsavg = zeros(1,nsamp);
elmsavg = zeros(1,nsamp);

muv = [.0075,.075];
elmsavga = [];
for i=1:length(muv)
  mu = muv(i);
  for nav = 1:navg
	rlsinit(ntaps,.01);
	lmsinit(ntaps,mu); 
	xin = 0*xin;
	x = 0*x;
	nav
	for k= 1:nsamp
	  bit = 2*(rand(1,1)>.5)-1;
	  xin = [bit;xin(1:end-1)];
	  x = [bit;x(1:end-1)];
      fout = xin'*trueh;
      savef(k) = fout;
	  xchannel = fout + randn(1,1)*sig;
	  d = x(sampout);
	  [hestrls,eaprls] = rls(xchannel,d);
	  [hestlms,eaplms] = lms(xchannel,d);
	  erls(k) = eaprls;
	  elms(k) = eaplms; 				%d - xlms'*hest;
	end
	erlsavg = erlsavg + erls.^2;
	elmsavg = elmsavg + elms.^2;
  end
  erlsavg = erlsavg/navg;
  elmsavg = elmsavg/navg;

  elmsavga = [elmsavga; elmsavg];
end


semilogy(sampout:length(elmsavg),elmsavga(1,sampout:end))
hold on
semilogy(sampout:length(elmsavg),elmsavga(2,sampout:end))
semilogy(sampout:length(erlsavg),erlsavg(sampout:end))
xlabel('number of iterations');
ylabel('Ensemble-averaged square error');
gtext('\mu=0.0075')
gtext('\mu=0.075')
gtext('RLS')
print -dps ../pictures/lms1err.ps
print -deps ../pictures/lms1err.eps
input('press enter')

clf
subplot(2,2,1);
stem(hopt);
xlabel('k');
ylabel('h_{opt}[k]');

subplot(2,2,2);
stem(hestlms)
xlabel('k');
ylabel('h_{lms}[k]');
print -dps ../pictures/lmsfiltcoeff.ps
print -deps ../pictures/lmsfiltcoeff.eps

