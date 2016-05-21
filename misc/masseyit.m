function c = masseyit(y)
% 
% Compute the lfsr connection polynomial using Massey's algorithm
% accepting new data at each iteration.
% masseyinit should be called before calling this the first time
%
% y = new data point
%
% c = updated connection polynomial

% Copyright 1999 by Todd K. Moon


global Lnmas; global Lmmas; global cmas; global pmas; global smas;
global ymas; global Nmas;

n = length(y);

for N=1:n    % N = current matching output sequence length
  Nmas = Nmas+1;
  ymas = [ymas y(N)];
  d = mod(cmas*ymas(Nmas:-1:Nmas-Lnmas)',2); 
                                  % compute the discrepancy (binary arith.)
  if(d == 0)	                  % no discrepancy
	smas = smas+1;
  else
	if(2*Lnmas > Nmas-1)             % no length change in update
	  cmas = mod(cmas + [zeros(1,smas) pmas zeros(1,Lnmas-(Lmmas+smas))],2);
	  smas = smas+1;
	else                          % update with new length
	  t = cmas;
	  cmas = mod([cmas zeros(1,Lmmas+smas-Lnmas)] + [zeros(1,smas) pmas],2);
	  Lmmas = Lnmas;  Lnmas = Nmas - Lnmas;	  pmas = t;   smas = 1;
	end
  end
end
c = cmas;

