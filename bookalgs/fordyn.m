function [pathlist,cost] = fordyn(G,W)
%
% Do forward dynamic programing
%
% function [pathlist,cost] = fordyn(G,W)
%
% G = list of next vertices
% W = list of costs to next vertices
%
% pathlist = list of paths through graphs
% cost = cost of the paths

% Copyright 1999 by Todd K. Moon

[m,n] = size(G);   % n = number of vertices
n = n+1;
costs(n) = 0;
for j=n-1:-1:1
  c = W{j}+costs(G{j});
  [minc,idx] = min(c);
  costs(j) = minc;
  savevertex(j) = G{j}(idx);
end
cost = costs(1); 
pathlist(1) = 1;
for j=2:n
  pathlist(j) = savevertex(pathlist(j-1));
  if(pathlist(j) == n)
    break;
  end
end