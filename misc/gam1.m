function [B,b0,b,l] = gam1(p,o)
% 
% Determine the optimum bet on a subfair track
%
% function [B,b0,b,l] = gam1(p,o)
%
% p = probability of win
% o = subfair odds
%
% B = other bets
% b0 = amount witheld
% b = bet

% Copyright 1999 by Todd K. Moon

m = length(o)
% Kelly's method: sort them
r = o .* p
[x,i] = sort(r);
r = r(i(end:-1:1))
p = p(i(end:-1:1));
o = o(i(end:-1:1));

b0last = 1;
savet = 0;
savepsum = 0;
for t=1:m
  psum = sum(p(1:t))
  sigma = sum(1 ./ o(1:t))
  b0 = (1-psum)/(1-sigma)
  if(b0 < b0last & b0 > 0)
	b0last = b0;
	savet = t;
	savepsum = psum;
  end
end
b0last
savet
b = max(p - b0last ./ o,0);
b = b(i(end:-1:1))  % unsort
b0 = b0last;
if(savet)
  B = i(end:-1:end-savet+1)
  l = sum(p(B) .* log(p(B) .* o(B))) + (1-savepsum)*log(b0)
else
  B = [];
  l = 0;
end