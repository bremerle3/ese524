function initvit1(intrellis, inbranchweight, inpathlen, innormfunc)
% 
% Initialize the data structures and pointers for the Viterbi algorithm
% 
% function initvit1(intrellis, inbranchweight, inpathlen, innormfunc)
%
% intrellis: a description of the successor nodes 
%    e.g. [1 3; 3 4; 1 2; 3 4]
% inbranchweight: weights of branches used for comparison, saved as
%    cells in branchweight{state_number, branch_number}
%    branchweight may be a vector
%    e.g.  branchweight{1,1} = 0; branchweight{1,2} = 6;
%          branchweight{2,1} = 3; branchweight{2,2} = 3;
%          branchweight{3,1} = 6; branchweight{3,2} = 0;
%          branchweight{4,1} = 3; branchweight{4,2} = 3;
% inpathlen: length of window over which to compute
% normfun: the norm function used to compute the branch cost

% Copyright 1999 by Todd K. Moon

clear savepath endp trellis pathlen numstate branchweight
clear pathcost priorstate dooutput normfunc

global savepath endp trellis pathlen numstate branchweight
global pathcost priorstate dooutput normfunc

trellis = intrellis;
[temp,numstate] = size(intrellis);
pathlen = inpathlen;
normfunc = innormfunc;
branchweight = inbranchweight;
endp = 0;
dooutput = 0;
savepath = zeros(numstate,inpathlen);
pathcost = (realmax/2)*ones(numstate,1); % set initially to huge number
pathcost(1) = 0;
% set up the prior state information
numpriorstate = zeros(numstate,1);
priorstate = [];
for state=1:numstate
  for nextstate = trellis{state}
    numpriorstate(nextstate) = numpriorstate(nextstate)+1;
    priorstate(nextstate,numpriorstate(nextstate)) = state;
  end
end