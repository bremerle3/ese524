% Program to draw the paths for the Viterbi algorithm using a LaTeX picture
% Copyright 1999 by Todd K. Moon

global savepath endp trellis pathlen visited numstate branchweight
global pathcost priorstate dooutput maxnumbranch

fname = '../pictures/vitrun.tex';
fid = fopen(fname,'w');

ttrellis = [1 2;
            3 4;
            1 2;
            3 4];

myvisited = zeros(4,1);
myvisited(1) = 1;
tbranchweight{1,1} = 0;    % node 1, branch 1
tbranchweight{1,2} = 6;    % node 1, branch 2
tbranchweight{2,1} = 3;    % node 2, branch 1
tbranchweight{2,2} = 3;    % node 2, branch 2
tbranchweight{3,1} = 6;    % node 3, branch 1
tbranchweight{3,2} = 0;    % node 3, branch 2
tbranchweight{4,1} = 3;    % node 4, branch 1
tbranchweight{4,2} = 3;    % node 4, branch 2

pathl = 7
initvit1(ttrellis,tbranchweight,pathl,'vitsqnorm');

fprintf(fid,'\\documentclass{article}\n');
fprintf(fid,'\\usepackage{latexsym}\n');
fprintf(fid,'\\usepackage{epic}\n');
fprintf(fid,'\\begin{document}\n');
fprintf(fid,'\\begin{center}\n');

numbranch = 0;
rvec = [6 3 6 6 3 3 0 5 1 3]; 
for r = rvec
  p = viterbi1(r);
  numbranch = numbranch+1;
  drawtrellis(fid,numbranch,r,p);
  if( rem(numbranch,2))
    fprintf(fid,'~');
  else
    fprintf(fid,'\\\\[.2em]\n');
  end  
end

% 
fprintf(fid,'\\end{center}\n');
fprintf(fid,'\\end{document}\n');  
fclose(fid);