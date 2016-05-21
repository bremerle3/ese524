% Make least-squares data matrices 
% Copyright 1999 by Todd K. Moon

xin = [1 -2 3 -4 5]'
n = 3;  % # of filter weights
N = length(xin)

% make the covariance data
Xcv = [];
for i=1:n  % loop over the columns
  xv = xin(n-i+1:n-i+n);
  Xcv = [Xcv xv];
end
Xcv
Gcv = Xcv'*Xcv

% make the autocorrelation data
Xac = [];
for i=1:n  % columns
  xv = [zeros(i-1,1); xin; zeros(n-i,1)];
  Xac = [Xac xv];
end
Xac
Gac = Xac'*Xac

% make the pre-window data
Xpw = [];
for i=1:n
  xv = [zeros(i-1,1); xin(1:N-i+1)];
  Xpw = [Xpw xv];
end
Xpw
Gpw = Xpw'*Xpw

% make the post-window data
Xw = [];
for i=1:n
   xv = [xin(n-i+1:N); zeros(n-i,1)];
   Xw = [Xw xv];
end
Xw
Gw = Xw'*XwRemove[Gac]