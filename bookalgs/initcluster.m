function Y = initcluster(X,m)
%
% 
% Choose an initial cluster at random
% 
% function Y = initcluster(X,m)
%
% X = input data: each column is a training data vector
% m = number of clusters
% Y = initial cluster: each column is a point

% Copyright 1999 by Todd K. Moon

[n,N] = size(X);
if(N > m)
  replace = 0;
else
  replace = 1;
end
chosen = zeros(1,N);
Y = zeros(n,m);
for i=1:m
  draw = floor(N*rand + 1);
  if(~replace)
    while(chosen(draw))
      draw = N*rand + 1;
    end
  end
  Y(:,i) = X(:,draw);
  chosen(draw) = 1;
end