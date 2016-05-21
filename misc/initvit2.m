function initvit2(intrellis, inbranchweight, inpathlen, innormfunc)
% 
% Initialize the data structures and pointers for the Viterbi algorithm
%
% function initvit2(intrellis, inbranchweight, inpathlen, innormfunc)
%
% intrellis: a description of the successor nodes using a list, e.g.
%          intrellis{1} = [1 3]; intrellis{2} = [3 4];
%          intrellis{3} = [1 2]; intrellis{4} = [3 4];
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

global savepath endp trellis pathlen visited numstate pbranchweight
global pathcost priorstates dooutput normfunc

trellis = intrellis;
[temp,numstate] = size(intrellis);
pathlen = inpathlen;
normfunc = innormfunc;
branchweight = inbranchweight;
endp = 0;
dooutput = 0;
savepath = zeros(numstate,inpathlen);
visited = zeros(numstate,1);
visited(1) = 1;
%pathcost = zeros(1,numstate);
pathcost = realmax*ones(1,numstate);
pathcost(1) = 0;
% set up the prior state information
for state=1:numstate
  priorstates{state} = [];
  pbranchweight{state} = [];
end
for state=1:numstate
  bc = 0;
  for nextstate = trellis{state}
    bc = bc+1;
    priorstates{nextstate} = [priorstates{nextstate} state];
    pbranchweight{nextstate} = [pbranchweight{nextstate} ...
            branchweight{state}(bc)];
  end
end