% Copyright 1999 by Todd K. Moon

HMM.A = [0 1/4 .2;   1 1/4 .4;   0 1/2 .4];
HMM.pi = [1;0;0];
HMM.final = [0 0 1];
HMM.f{1} = 2;   % Gaussian distribution
HMM.f{2,1} = [1;1;1];
HMM.f{2,2} = [-1;-1;-1];
HMM.f{2,3} = [5;5;5];
HMM.f{3,1} = .5*eye(3);
HMM.f{3,2} = .6*eye(3);
HMM.f{3,3} = .7*eye(3);