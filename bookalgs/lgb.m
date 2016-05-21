function [Y,d] = lgb(X,m)
% 
% Find m clusters on the data X
%
% function [Y,d] = lgb(X,m)
%
%
% X = input data: each column is a training data vector
% m = number of clusters to find
%
% Y = set of clusters: each column is a cluster centroid
% d = minimum total distortion

% Copyright 1999 by Todd K. Moon

[n,N] = size(X);          % n = dimension, N = number of training data
Y = initcluster(X,m);     % choose an initial set at random
index = zeros(1,N);       % index list for all Voronoi regions
vorindex = zeros(1,N);    % index list for one Voronoi region
cumdist = 0;  lastdist = Inf; 
stoppingeps = 1.e-5;
while(abs(cumdist - lastdist) > 1.e-5)
  lastdist = cumdist;     cumdist = 0;
  % form Voronoi regions: for each vector x, determine which 
  % centroid it is closest to
  for i=1:N
    mindist = Inf;
    for j=1:m
      nm = norm(X(:,i) - Y(:,j));
      if(nm < mindist)
        saveindex = j;
        mindist = nm;
      end
    end
    index(i) = saveindex;
    cumdist = cumdist + mindist;
  end
  % Compute centroids of each Voronoi region
  for j=1:m
    vorindex = (index==j);
    Y(:,j) = (sum((X(:,vorindex)).')/sum(vorindex)).';
  end
end
d = mindist;