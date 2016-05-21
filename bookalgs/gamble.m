function [b0,B] = gamble(p,o)
%
% Return the bets for a race with win probabilities p and subfair odds o,
%
% function [b0,B] = gamble(p,o)
%
% p = probability of win
% o = subfair odds

% b0 = amount withheld
% B = other bets
 
% Copyright 1999 by Todd K. Moon
 
lambda = 1;
% sort in increasing order
[bo,idx] = sort(p(:) .* o(:));
bo = flipud(bo);  idx = flipud(idx);  p = p(idx);  o=o(idx);
t = 0;
b0 = 1;
minb0 = 1;
mint = 0;
B = zeros(size(p));
if(bo(1) < 1)
  return;
end
for t=1:length(p)-1
  pit = sum(p(1:t));  sigmat = sum(1./o(1:t));
  b0 = (1-pit)/(1-sigmat);
  if(b0 < minb0)
  minb0 = b0;
  mint = t;
  end
end
for i=1:length(p)
  B(i) = max(p(i)- minb0/o(i),0);
end
b0 = minb0;
B = B(idx);  % flip back