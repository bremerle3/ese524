function Anew = warshall(A)
% 
% Find the transitive closure of the graph represented by the adjacency
% matrix A
%
% function Anew = warshall(A)
%
% A = adjacency matrix of graph
% 
% Anew = adjacency matrix for transitive closure of graph

% Copyright 1999 by Todd K. Moon

[n,n] = size(A);
Anew = A;
for b=1:n
  for a=1:n
    if(Anew(a,b))                           % if we can get from a to b
      Anew(a,:) = max(Anew(b,:),Anew(a,:)); % then we can get from a 
                                            % to anywhere b gets to
    end
  end
end 