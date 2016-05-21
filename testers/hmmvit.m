% test the HMM stuff using the VA
% Copyright 1999 by Todd K. Moon

% Set up the HMM parameters
HMM.A = [.1 0 0 0; .7 .1 0 0;.2 .6 .2 0; 0  .3 .8 1];
HMM.pi = [.5 .4 .1 0];
HMM.f{1} = 1;      % discrete distribution
HMM.f{2} = [.2 .3 .5; .1 .1 .8; .8 .2 0; .1 .4 .5]';
HMM.final = [0 0 1 1];

hmminitvit(HMM,10);                     % Initialize the VA for the HMM

global pathcost
global savepath

xlist = [2 3 1 3];        % the observed sequence
plist = [];
for x = xlist                           % for each observation
  p = viterbi1(x);
  if(p)
    plist = [plist p];
  end
end
plist = [plist vitflush(find(HMM.final ~= 0))]; % flush to valid final states
c1= vitbestcost

hmmnew = hmmupdatev(xlist,HMM);

hmminitvit(hmmnew,10);
plist = [];
for x = xlist                           % for each observation
  p = viterbi1(x);
  if(p)
    plist = [plist p];
  end
end
plist = [plist vitflush(find(HMM.final ~= 0))]; % flush to valid final states
c1= vitbestcost