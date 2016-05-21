function hmminitvit(inHMM,inpathlen)
% 
% Initialize the Viterbi algorithm stuff for HMM sequence identification
%
% function hmminitvit(inHMM,inpathlen)
% 
% inHMM = a structure containing the initial probabilities, state transition
%         probabilities, and output probabilities
% inpathlen = length of window used in VA

% Copyright 1999 by Todd K. Moon

global vHMM;                     % used in computation of branch weights
global pathcost;                 % the pathcost for the VA
vHMM = inHMM;
[nstate,nstate] = size(vHMM.A);
nlist = zeros(1,nstate);     bigno = realmax;
 
for i=1:nstate                   % "from" state
  Atrellis{i} = [];
  k = 0;
  for j=1:nstate                 % "to" state
    if vHMM.A(j,i)
      k = k+1;
      Atrellis{i} = [Atrellis{i} j];
      hmmbranchweight{i,k} = [ -log(vHMM.A(j,i))];
    end
  end
end
% Now initialize the Viterbi algorithm stuff
initvit1(Atrellis,hmmbranchweight, inpathlen, 'hmmnorm');
% set up the initial path costs
idx = find(vHMM.pi ~= 0);
pathcost(idx) = -log(vHMM.pi(idx));     % valid starting paths
idx = find(vHMM.pi == 0);
pathcost(idx) = realmax;