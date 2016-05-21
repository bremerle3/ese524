function xp = permutedata(x,type)
% 
% Randomly permute the columns of the data x.
%
% function xp = permutedata(x,type)
%
% x = data to permute
% type=type of permutation
%   type=1: Choose a random starting point, and go sequentially
%   type=2: random selection without replacement (not really a permutation)
%
% xp = permuted x

% Copyright 1999 by Todd K. Moon

[n,M] = size(x);
switch type
  case 1,
     start = floor(M*rand+1);
   xp = x(:,start:end);
     xp = [xp x(:,1:start-1)];
  case 2,
     randind = floor(M*rand(1,M)+1);
   xp = x(:,randind);
  otherwise,
     error('invalid permutation type')
end