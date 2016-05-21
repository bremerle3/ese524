function [f,gamma] = fromcrtpoly(y,m,gammain)
% 
% Compute the representation of the polynomial f using the Chinese Remainder
% Theorem (CRT) using the moduli m = [m1,m2,...,mr].  It is assumed 
% (without checking) that the moduli are relatively prime.  
% Optionally, the gammas may be passed in (speeding computation), and
% are returned as optional return values.
%
% function [f,gamma] = fromcrtpoly(y,m,gammain)
% function [f] = fromcrtpoly(y,m)
% function [f,gamma] = fromcrtpoly(y,m)
% function [f] = fromcrtpoly(y,m,gammain)
%
% y = list of polynomials (cell array)
% m = list of moduli (cell array)
% gammain = (optional)list of gammas (cell array)
%
% f = reconstructed polynomial
% gamma = gamma

% Copyright 1999 by Todd K. Moon

r = length(y);
if(nargin==2)
  mp = 1;
  for i=1:r
    mp = polymult(mp,m{i});
  end
  f = 0;
  for i=1:r
    [q,rm] = polydiv(mp,m{i});
    [g,b,y1] = gcdpoly(q,m{i});
    gamma{i} = polymult(q,b);
    f = polyadd(f,polymult(gamma{i},y{i}));
  end
else            % use the passed-in gammas
  f = 0;
  for i=1:r
    f = polyadd(f,polymult(gammain{i},y{i}));
  end
  gamma = gammain;
end
% Take the result modulo m
[q,f] = polydiv(f,mp);