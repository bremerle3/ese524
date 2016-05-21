function [g,s,t] = sugiyama(y,p)
% 
% Compute the GCD g = (b,c) using the Euclidean algorithm
% and return s,t such that bs+ct = g, where b and c are polynomials
% with real coefficients
%
% thresh = (optional) threshold argument used to truncate small remainders

% Copyright 1999 by Todd K. Moon

rm2 = zeros(1,2*p+1);  rm2(1) = 1;   % set to x^{2p}
rm1 = y;
sm2 = 1; sm1 = 0;
tm2 = 0; tm1 = 1;
while(any(rm1))
  [q,tr] = polydiv(rm2,rm1);
  if(length(tr)-1 < p)
    tr
    break;
  end
  ts = polysub(sm2,polymult(q,sm1));
  tt = polysub(tm2,polymult(q,tm1));
  rm2 = rm1; sm2 = sm1;  tm2 = tm1; 
  rm1 = tr;  sm1 = ts;  tm1 = tt;
end
lc = rm2(1);                    % make monic
g = rm2/lc;
s = sm2/lc;
t = tm2/lc;