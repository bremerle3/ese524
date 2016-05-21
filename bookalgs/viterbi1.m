function [p] = viterbi1(r)
% 
% Run the Viterbi algorithm on the input for one branch
% Before calling this function, you must call initvit1
%
% function [p] = viterbi1(r)
%
% r = input value (scalar or vector)
%
% p = 0 if number of branches in window is not enough
% p = statenum on path if enough branches in window
%
% Call vitflush to clear out path when finished

% Copyright 1999 by Todd K. Moon

global savepath endp trellis pathlen numstate branchweight
global pathcost priorstate dooutput normfunc

% Step 1: for each state, extend the path to the next stage
numtostate = zeros(numstate,1); 
nextvisited = zeros(numstate,1);
for state=1:numstate
  j = 1;
  for nextstate = trellis{state}        % go to each succeeding state
    numtostate(nextstate) = numtostate(nextstate)+1;
    cost{nextstate}(numtostate(nextstate)) = pathcost(state) + ...
        feval(normfunc,branchweight{state,j},r,state,nextstate);
    j = j+1;
    end
end
% Step 2 determine the smallest cost path to each state
endp = rem(endp,pathlen)+1;
for nextstate=1:numstate
  if(~isempty(cost{nextstate}))  % if this state _is_ a next state
    [bcost,priorstateno] = min(cost{nextstate});
  else
    bcost = inf; priorstateno=1; % prior state does not matter if cost is inf
  end
  pathcost(nextstate) = bcost;
  priorst = priorstate(nextstate,priorstateno);
  % step 3 save the path info
  savepath(nextstate,endp) = priorst;
end
% if long enough window, output value
if(endp == pathlen)  % first time the window is long enough
  dooutput = 1;
end
done = dooutput; p = 0;
if(dooutput)
  % find path with smallest metric
  [pcost,minstate] = min(pathcost);
  pathlist = mod(endp-1:-1:endp-pathlen,pathlen)+1;
  % search backward through the path to be beginning of the window
  for branch = pathlist
    minstate = savepath(minstate,branch);
  end
  p = minstate;
end