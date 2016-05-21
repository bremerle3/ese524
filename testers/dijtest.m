% Test Sisjstras and Warshall's algorithms
% Copyright 1999 by Todd K. Moon

cost = [0 inf inf inf inf inf inf inf
        3 0 inf inf inf inf inf inf
        10 8 0 inf inf inf inf inf
        inf inf 12 0 inf inf inf inf
        inf inf inf 15 0 2.5 9 inf
        inf inf inf 10 inf 0 inf 14
        inf inf inf inf inf inf 0 10
        17 inf inf inf inf inf inf 0]
node = 5

[d,p] = dijkstra(5,cost)

% test Warshall
A = [1 1 0 0 0 1 1 0 0 0 0 0 0 
     0 1 0 0 0 0 0 0 0 0 0 0 0
     1 0 1 0 0 0 0 0 0 0 0 0 0
     0 0 0 1 0 1 0 0 0 0 0 0 0
     0 0 0 1 1 0 0 0 0 0 0 0 0
     0 0 0 0 1 1 0 0 0 0 0 0 0
     0 0 1 0 1 0 1 0 0 1 0 0 0
     0 0 0 0 0 0 1 1 1 0 0 0 0
     0 0 0 0 0 0 0 1 1 0 0 0 0
     0 0 0 0 0 0 0 0 0 1 1 1 1
     0 0 0 0 0 0 0 0 0 0 1 0 0
     0 0 0 0 0 0 1 0 0 0 0 1 1
     0 0 0 0
     0 0 0 0 0 0 0 1 1]
warshall(A);

cost = [0 0 0 0 0 0 0 0
        1 0 0 0 0 0 0 0
        1 1 0 0 0 0 0 0
        0 0 1 0 0 0 0 0
        0 0 0 1 0 1 1 0
        0 0 0 1 0 0 0 1
        0 0 0 0 0 0 0 1
        1 0 0 0 0 0 0 0];

warshall(cost)