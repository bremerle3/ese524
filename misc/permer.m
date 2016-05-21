function permlist = permer(n1,p,perm,permnew,permlist)
% 
% function permlist = permer(n1,p,perm,permnew,permlist)

% Copyright 1999 by Todd K. Moon

n = length(p);
for i=1:n
  permnew(n1-n+1) = p(i);
  if(n>1)
	prest = p([1:i-1 i+1:n]);
	permlist = permer(n1,prest,perm,permnew,permlist);
  else
	permlist = [permlist;permnew];
  end
end
