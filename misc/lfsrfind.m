function c = lfsrfind(A,b)
% 
% Find a good lfsr c to match Ac=b
%
% function c = lfsrfind(A,b)

% Copyright 1999 by Todd K. Moon

[n,m] = size(A);
statelist = 0;							% list of states examined
e = b;									% initial error
state = 0;
stateb = n2b(state,m);					% state in binary form
bestd = n+1;
while(1)
  mind = n+1;
  for j=1:m								% check all the column of A
	d = mod(A(:,j)-e,2);
	sd = sum(d);
	if(sd<=mind)
	  if(sd < mind)						% new better result
		minlist = [];                   % start a new list
	  end
	  mind = sd;
	  minlist = [minlist j];
	end
  end
  % determine candidate next states
  newstatelist = [];
  newjlist = [];
  for s = minlist
	newstate = b2n(rem(n2b(2^(s-1),m) + stateb,2),m);
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
  stateb = n2b(state,m);
  statelist = [statelist state];
  bnew = rem(A*stateb',2);
  e = mod(b-bnew,2);
  de = sum(e);
  if(de < bestd)
	beststate = state;
	bestd = de;
  end
  if(bestd==0) break;
  end
end
c = n2b(beststate,m)';
