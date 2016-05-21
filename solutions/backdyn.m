function [pathlist,cost] = backdyn(H,W)
%
% Backward dynamic programming
%
% function [pathlist,cost] = backdyn(H,W)
%
% H = graph
% W = costs
%
% pathlist = list of paths
% cost = cost of paths

% Copyright 1999 by Todd K. Moon

[m,n] = size(H);   % n = number of vertices
n= n+1;
costs(1) = 0;
for j=2:n-1;
  c = W{j}+costs(H{j});  % add all the costs to this state
  [minc,idx] = min(c);   % determine path with minimum cost
  costs(j) = minc;
  savevertex(j) = H{j}(idx);
end
cost = costs(n-1);
pathlist(1) = n-1;
for j=2:n
  pathlist(j) = savevertex(pathlist(j-1));
  if(pathlist(j) == 1)
    break;
  end
end
pathlist = fliplr(pathlist);