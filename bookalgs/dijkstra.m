function [dist,prevnode] = dijkstra(a,cost)
% 
% Find the set of shortest paths from vertex a to each of the other vertices
% in the graph represented by the cost matrix.
% If there is no branch from i to j, then cost(i,j) = inf.
%
% function [dist,prevnode] = dijkstra(a,cost)
% 
% a = starting vectex
% cost = cost matrix for graph
%
% dist(i) = shortest distance from vertex a to vertex i.
% prevnode(i) = vertex prior to vertex i on the shortest path to i.

% Copyright 1999 by Todd K. Moon

[n,n] = size(cost);
% Initialization
s = zeros(1,n);               % the set of vertices examined so far
dist = cost(a,:);             % dist(w)=distance from vertex a to w
s(a) = 1;  dist(a) = 0;
prevnode = a*ones(1,n);       % default values for previous node
for nn = 2:n                  % loop for each vertex added
  % find the smallest path among those vertices not in S
  sz = find(s==0);
  [val,k] = min(dist(sz));
  u = sz(k);                  % the new vertex
  s(u) = 1;                   % set that this one has been seen
  for w=find(s==0)            % update all the distances to vertices not in S
    [dist(w),j] = min([dist(w),dist(u) + cost(u,w)]);
    if(j==2) 
      prevnode(w) = u;
    end
  end
end