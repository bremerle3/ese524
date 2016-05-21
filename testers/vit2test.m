function vittest()
% Test and plot the results of the viterbi algorithm
% Copyright 1999 by Todd K. Moon

global savepath startp endp trellis pathlen visited numstate branchweight
global pathcost priorstate dououtput earlieststate

ttrellis{1} = [1 2];
ttrellis{2} = [3 4];
ttrellis{3} = [1 2];
ttrellis{4} = [3 4];

tbranchweight{1} = [0 6];
tbranchweight{2} = [3 3];
tbranchweight{3} = [6 0];
tbranchweight{4} = [3 3];    % node 4, branch 1

initvit2(ttrellis,tbranchweight,3,'vitsqnorm');
 
r = 6;
p = viterbi2(r)
%savepath
%pathcost
 
r = 3;
p = viterbi2(r)
%savepath
%pathcost

r = 6;
p = viterbi2(r)
%savepath
%pathcost
% 
r = 6;
p = viterbi2(r)
%savepath
%pathcost

r = 3;
p = viterbi2(r)
%savepath
%pathcost

r = 3;
p = viterbi2(r)
%savepath
%pathcost

r = 0;
p = viterbi2(r)
%savepath
%pathcost

%vitflush(0)

