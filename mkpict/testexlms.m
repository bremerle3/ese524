% Test the lms in a system identification setting
% Assume a Gaussian input
% Copyright 1999 by Todd K. Moon

inputvar = 0.001;
insig = sqrt(inputvar);
ntaps = 6;             % number of adaptive filter taps
 
trueh = [.5; -1; -2; 1; .5];
lh = length(trueh);
noisevar = 0.001;
noisevar = 0;

global xlms;
global mulms;
global hlms;
mu = 0.001;
xin = zeros(lh,1);    % the input vector
sig = sqrt(noisevar); % measurement noise variance
navg = 100;            % number of runs to average together
nsamp = 1000;          % number of samples to adapt
elms = zeros(1,nsamp);% lms error (per iteration)
elmsavg = zeros(1,nsamp); % average lms error
for nav=1:navg        % average run
  lmsinit(ntaps,mu);  % re-initialize the filter
  xin = 0*xin;        % clear the plant
  nav
  for k= 1:nsamp               % for each sample in time
	in = randn(1,1) * insig;   % generate random input signal
	xin = [in;xin(1:lh-1)];    % stack up for plant state variable
    fout = xin'*trueh;         % compute plant output
	d = fout + randn(1,1)*sig; % noisy measurement
	[hestlms,e] = lms(in,d);   % adapt
%	e = d - xlms'*hestlms;
	elms(k) = e;
  end
  elmsavg = elmsavg + elms.^2;
end
elmsavg = elmsavg/navg;

clf
subplot(2,2,1);
stem(trueh);
xlabel('k');
ylabel('h_{true}[k]');

subplot(2,2,2);
stem(hestlms);


