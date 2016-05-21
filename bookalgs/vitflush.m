function [plist] = vitflush(termnode)
% 
% Flush out the rest of the viterbi paths
%
% function [plist] = vitflush(termnode)
%
% termnode = 0 or list of allowable terminal nodes
%    If termnode==0, then choose path with lowest cost
%    Otherwise, choose path with best cost among termnode
%
% plist = list of paths from trellis

% Copyright 1999 by Todd K. Moon

global savepath endp trellis pathlen numstate branchweight
global pathcost priorstate dooutput

% Find path with smallest metric
if(termnode)
  [pcost,minstate] = min(pathcost(termnode));
  minstate = termnode(minstate);
else
  [pcost,minstate] = min(pathcost);
end
plist = minstate;
pathlist = mod(endp-2:-1:endp-pathlen+1,pathlen)+1;
% Now work backward from end of list
for branch = pathlist
  minstate = savepath(minstate,branch);
  if(minstate)
    plist = [plist minstate];
  else
    break;
  end
end
plist = fliplr(plist);                  % reverse the list