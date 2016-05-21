function vittest()
% 
% Test and plot the results of the viterbi
%
% function vittest()

% Copyright 1999 by Todd K. Moon

global savepath startp endp trellis pathlen visited numstate branchweight
global pathcost priorstate dououtput earlieststate

ttrellis{1} = [1 2];  ttrellis{2} = [3 4];  
ttrellis{3} = [1 2];  ttrellis{4} = [3 4];

tbranchweight{1,1} = 0;    % node 1, branch 1
tbranchweight{1,2} = 6;    % node 1, branch 2
tbranchweight{2,1} = 3;    % node 2, branch 1
tbranchweight{2,2} = 3;    % node 2, branch 2
tbranchweight{3,1} = 6;    % node 3, branch 1
tbranchweight{3,2} = 0;    % node 3, branch 2
tbranchweight{4,1} = 3;    % node 4, branch 1
tbranchweight{4,2} = 3;    % node 4, branch 2

initvit1(ttrellis,tbranchweight,3,'vitsqnorm');
 
r = 6;
p = viterbi1(r)
%savepath
%pathcost
 
r = 3;
p = viterbi1(r)
%savepath
%pathcost

r = 6;
p = viterbi1(r)
%savepath
%pathcost
% 
r = 6;
p = viterbi1(r)
%savepath
%pathcost

r = 3;
p = viterbi1(r)
%savepath
%pathcost

r = 3;
p = viterbi1(r)
%savepath
%pathcost

r = 0;
p = viterbi1(r)
%savepath
%pathcost

vitflush(0)

