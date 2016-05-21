function vittest()
% 
% Test and plot the results of the viterbi
% 
% function vittest()

% Copyright 1999 by Todd K. Moon

global savepath startp endp trellis pathlen visited numstate branchweight
global pathcost priorstate dououtput earlieststate

ttrellis = [ 2 3 0
             3 4 0
             2 4 5
             5 6 7
			 4 6 0
			 7 0 0
			 0 0 0]

tbranchweight{1,1} = -.0101;    % node 1, branch 1
tbranchweight{1,2} = -.0305;    % node 1, branch 2
%
tbranchweight{2,1} = -.0101;    % node 2, branch 1
tbranchweight{2,2} = -.0101;    % node 2, branch 2

tbranchweight{3,1} = -.0101;    % node 3, branch 1
tbranchweight{3,2} = -.0202;    % node 3, branch 1
tbranchweight{3,3} = -.0408;    % node 3, branch 2

tbranchweight{4,1} = -.0101;    % node 4, branch 1
tbranchweight{4,2} = -.0202;    % node 4, branch 1
tbranchweight{4,3} = -.0619;    % node 4, branch 2

tbranchweight{5,1} = -.0101;    % node 4, branch 1
tbranchweight{5,2} = -.0305;    % node 4, branch 1

tbranchweight{6,1} = -.0305;    % node 4, branch 1

initvit1(ttrellis,tbranchweight,10,'vitnop');
 
r = 0   % from state 1
p = viterbi1(r)
%savepath
%pathcost
 
r = 0   % from state 2
p = viterbi1(r)
%savepath
%pathcost

r = 0   % from state 4
p = viterbi1(r)
%savepath
%pathcost
% 
r = 0   % from state 3
p = viterbi1(r)
%savepath
%pathcost

r = 0   % from state 2
p = viterbi1(r)
%savepath
%pathcost

r = 0   % from state 4
p = viterbi1(r)
%savepath
%pathcost

r = 0   % from state 4
p = viterbi1(r)

r = 0   % from state 4 (to state 3)
p = viterbi1(r)
r = 0   % from state 4 (to state 3)
p = viterbi1(r)
r = 0   % from state 4 (to state 3)
p = viterbi1(r)
r = 0   % from state 4 (to state 3)
p = viterbi1(r)

% savepath
%pathcost


vitflush(7)
savepath
pathcost

% 
%$$$ rvec = [6 3 3 6 6 3 0 1]
%$$$ for r=rvec
%$$$   r
%$$$   [p,done] = viterbi1(r,'vitnop');
%$$$ end
