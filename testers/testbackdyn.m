% test the forward dynamic programming algorithm
% Copyright 1999 by Todd K. Moon

H{2} = 1;      H{3} = 1;       H{4} = 1;        H{5} = 1;
H{6} = [2,4];  H{7} = [2,3];   H{8} = [3,4,5];
H{9} = 6;      H{10} = [6,7];  H{11} = [6,7,8]; H{12} = 7;
H{13} = [9,10,11,12];
W{2} = 6;      W{3} = 2;       W{4} = 3;        W{5} = 4;
W{6} = [2,3];  W{7} = [3,9];   W{8} = [4,5,2];
W{9} = 2;      W{10} = [3,5];  W{11} = [7,2,3]; W{12} = 6;
W{13} = [4,2,3,5];

[plist,cost] = backdyn(H,W)
