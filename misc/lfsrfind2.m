function c = lfsrfind2(y,m)
% 
% Find a good lfsr c to match Ac=b
% where A and b are formed by the lfsr
% In this case, feed the error back around
%
% function c = lfsrfind2(y,m)

% Copyright 1999 by Todd K. Moon

y = y(:);
y0 = y(1:m);							% initial conditions
yr = y(m+1:end);
n = length(y);
statelist = 0;							% list of states examined
state = 0;
stateb = n2b(state,m)';					% state in binary form
bestd = n+1;
while(1)
  mind = n+1;  
  for j=1:m
	ns = state + 2^(j-1);
	newc = n2b(ns,m)';
	yn = lfsr(newc,y0,n-m)';
	d = mod(yr-yn,2);
	sd = sum(d);
	if(sd <= mind)
	  if(sd < mind)
		minlist = [];
	  end
	  mind = sd;
	  minlist = [minlist j];
	end
  end
  % determine candidate next states
  newstatelist = [];
  newjlist = [];
  for s = minlist
	newstate = b2n(rem(n2b(2^(s-1),m)' + stateb,2),m);
	if(~any(newstate==statelist)) 		% not a previous state
	  newstatelist = [newstatelist newstate];
	  newjlist = [newjlist s];
	end
  end
  % any of the states in newstatelist can be used
  if(length(newjlist)==0)				% if none left, we are done
	break;
  end
  % take the first one
  state = newstatelist(1);
  stateb = n2b(state,m)';
  statelist = [statelist state];
  if(mind < bestd)
	beststate = state;
	bestd = mind;
  end
  if(bestd==0) break;
  end
end
c = n2b(beststate,m)';
