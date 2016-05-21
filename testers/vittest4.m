% Test and plot the results of the viterbi
% Copyright 1999 by Todd K. Moon

global savepath startp endp trellis pathlen visited numstate branchweight
global pathcost priorstate dououtput earlieststate

ttrellis{1} = [1 2 3];
ttrellis{2} = [4];
ttrellis{3} = [1 2 3];
ttrellis{4} = [3 4];
tbranchweight{1,1} = 1;    % node 1, branch 1
tbranchweight{1,2} = 2;    % node 1, branch 2
tbranchweight{1,3} = 3;    % node 1, branch 2
%
tbranchweight{2,1} = 4;    % node 2, branch 1

tbranchweight{3,1} = 5;    % node 3, branch 1
tbranchweight{3,2} = 6;    % node 3, branch 2
tbranchweight{3,3} = 7;    % node 3, branch 2

tbranchweight{4,1} = 8;    % node 4, branch 1
tbranchweight{4,2} = 9;    % node 4, branch 2

initvit1(ttrellis,tbranchweight,3,'vitsqnorm');

p = [];
r = 2   % from state 1
p = [p viterbi1(r)]
%savepath
pathcost
 
r = 4   % from state 2
p = [p viterbi1(r)]
%savepath
pathcost

r = 8   % from state 4
p = [p viterbi1(r)]
%savepath
pathcost
% 
r = 6   % from state 3
p = [p viterbi1(r)]
%savepath
%pathcost

r = 4   % from state 2
p = [p viterbi1(r)]
%savepath
%pathcost

r = 9   % from state 4
p = [p viterbi1(r)]
%savepath
%pathcost

r = 9   % from state 4
p = [p viterbi1(r)]

r = 8   % from state 4 (to state 3)
p = [p viterbi1(r)]
% savepath
%pathcost


vitflush(0)
