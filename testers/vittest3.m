function vittest()
%
% Ttest and plot the results of the viterbi
% 
% function vittest()

% Copyright 1999 by Todd K. Moon

global savepath startp endp trellis pathlen visited numstate branchweight
global pathcost priorstate dououtput earlieststate

ttrellis = [ 1 3;
            1 3;
            2 4;
            2 4];

tbranchweight{1,1} = [0 0];    % node 1, branch 1
tbranchweight{1,2} = [1 1];    % node 1, branch 2
tbranchweight{2,1} = [1 1];    % node 2, branch 1
tbranchweight{2,2} = [0 0];    % node 2, branch 2
tbranchweight{3,1} = [0 1];    % node 3, branch 1
tbranchweight{3,2} = [1 0];    % node 3, branch 2
tbranchweight{4,1} = [1 0];    % node 4, branch 1
tbranchweight{4,2} = [0 1];    % node 4, branch 2

initvit1(ttrellis,tbranchweight,15,'vitsqnorm');
 
r = [1 1]
p = viterbi1(r)
%savepath
%pathcost
 
r = [1 0]
p = viterbi1(r)
%savepath
%pathcost

r = [0 0]
p = viterbi1(r)
%savepath
%pathcost
% 
r = [1 0]
p = viterbi1(r)
%savepath
%pathcost

r = [1 1]
p = viterbi1(r)
%savepath
%pathcost

r = [0 1]
p = viterbi1(r)
%savepath
%pathcost

r = [0 0]
p = viterbi1(r)

r = [0 1]
p = viterbi1(r)
% savepath
%pathcost


vitflush(0)
