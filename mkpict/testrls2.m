% test the rls in a system identification setting
% Assume a binary +/- 1 input.
% Copyright 1999 by Todd K. Moon

ntaps = 11;             % number of adaptive filter taps
 
%$$$ nvals = 1:10;
%$$$ W = 3.5;
%$$$ trueh = .5*(1+cos(2*pi/W*(nvals-2)));
trueh = [.2 .3 .4 1 .3 .2 -.1]
lh = length(trueh);
noisevar = 0.001;

trueh = trueh';
global xrls;
global xlms;
global mulms;
xin = zeros(lh,1);
x = zeros(ntaps,1);
sig = sqrt(noisevar);
navg = 200;
nsamp = 100;
erls = zeros(1,nsamp);
elms = zeros(1,nsamp);

erlsavg = zeros(1,nsamp);
elmsavg = zeros(1,nsamp);
for nav=1:navg
  rlsinit(ntaps,.01);
  lmsinit(ntaps,.025);
  xin = 0*xin;
  x = 0*x;
  nav
  for k= 1:nsamp
	bit = 2*(rand(1,1)>.5)-1;
	xin = [bit;xin(1:end-1)];
    x = [bit;x(1:end-1)];
    fout = xin'*trueh;
	d = fout + randn(1,1)*sig;
	[hestrls,eap] = rls(bit,d);
	hestlms = lms(bit,d);
	erls(k) = eap;
	elms(k) = (d - xrls'*hestlms);
  end
  erlsavg = erlsavg + erls.^2;
  elmsavg = elmsavg + elms.^2;
end
erlsavg = erlsavg/navg;
elmsavg = elmsavg/navg;

clf
subplot(2,2,1);
stem(trueh);
xlabel('k');
ylabel('h_{true}[k]');
%$$$ print -dps ../pictures/rls2htrue.ps
%$$$ print -deps ../pictures/rls2htrue.eps

semilogy(sampout:length(erlsavg),erlsavg(sampout:end),...
    sampout:length(erlsavg),emin)
xlabel('number of iterations');
ylabel('Ensemble-averaged square error');
%$$$ print -dps ../pictures/rls2err.ps
%$$$ print -deps ../pictures/rls2err.eps

stem(hestrls)
xlabel('k');
ylabel('h_{rls}[k]');
%$$$ print -dps ../pictures/rls2hrls.ps
%$$$ print -deps ../pictures/rls2hrls.eps



