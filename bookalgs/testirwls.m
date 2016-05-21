% Test the irwls routine for a filter design problem
% After [Burrus 1994, p. 2934]

% Copyright 1999 by Todd K. Moon

N = 31;                          % number of filter coefficients
fs = .15;  fp = 0.1;  LF = 301;  % filter cutoff parameters
p=4;                             % L_p norm

R=(N+1)/2;   M=(N-1)/2;          % setup the matrices for optimization
Np = round(LF*fp/(fp+.5-fs));
Ns = LF-Np;   dp = fp/Np;   ds = (.5-fs)/Ns;
Ad = [ones(Np,1); zeros(Ns,1)];
f = [((0:Np-1)*dp + dp/2), ((0:Ns-1)*ds+fs+ds/2)]';
C = cos(2*pi*f*[0:R-1]);
a = irwls(C,Ad,p);               % find the Lp solution

mlist = 1:M; h(M-mlist+1,1) = a(mlist+1)/2;  h(M+mlist+1) = a(mlist+1)/2;
h(M+1) = a(1);                   % place into filter coefficients
[mh,w] = freqz(h,1,LF);   plot(w/pi,20*log(abs(mh)));
xlabel('f');
ylabel('|H(f)|')