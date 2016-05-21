function permlist = makeperms(n)
% Return all permutations of length n

% Copyright 1999 by Todd K. Moon

p = 1:n;
perm = []; permnew = 1:n;  permlist = [];
permlist = permer(n,p,perm,permnew,permlist);
