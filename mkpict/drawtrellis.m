function drawtrellis(fid,numbranch,r,p)
% 
% Draw a trellis in LaTeX picture mode
%
% function drawtrellis(fid,numbranch,r,p)
%
% fid = output file id
% numbranch = number of branches to draw
% r = path cost values
% p = flag
%
% Other values are contained in global variables.  See the file

% Copyright 1999 by Todd K. Moon


global savepath endp trellis pathlen visited numstate branchweight
global pathcost priorstate dooutput maxnumbranch

unitlen = '.12in';
xsp = 2;
ysp = 2;
pathcostfont = '\footnotesize';
timelabelfont = '\tiny';
%outputchar = '$\times$';
outputchar = '$\Diamond$';
dotchar = '$\bullet$';
dotchar = '\circle*{0.2}';
xpcoff = .6;
timeyoff = -.9;
yoff = 1;
roff = 0.5;

fprintf(fid,'\\setlength{\\unitlength}{%s}\n',unitlen);
fprintf(fid,'\\thinlines');
fprintf(fid,'\\framebox{');
fprintf(fid,'\\begin{picture}(%g,%g)(%g,%g)\n',pathlen*xsp+1,...
   (numstate-1)*ysp-timeyoff+roff+1,...
   -.2,-yoff);
 
fprintf(fid,'\\matrixput(0,0)(%d,0){%d}(0,%d){%d}{%s}\n',...
   xsp,(pathlen+1),ysp,numstate,dotchar);
  
numtoplot = min(numbranch,pathlen);
blist = mod(endp-1:-1:endp-numtoplot,pathlen)+1;
ntp = numtoplot; 
nb = numbranch+1;
fprintf(fid,'\\put(%d,%g){\\makebox(0,0)[bl]{%s $r$$=$$%d$}}',...
   (ntp-1)*xsp,(numstate-1)*ysp+roff,pathcostfont,r);
linefromhere = ones(numstate,1);
nextminstate = 0;
minstate = 0;
if(p)
  [minv,minstate] = min(pathcost)
end
firsttime = 1;
for b = blist
  newlinefromhere = zeros(numstate,1);
  ntp = ntp-1;
  nb = nb-1;
  for nextstate = 1:numstate
   prevstate = savepath(nextstate,b);
   if(prevstate & linefromhere(nextstate))
     newlinefromhere(prevstate) = 1;
     g = gcd(xsp,ysp*(prevstate-nextstate));
     if(nextstate == minstate)
      nextminstate=prevstate;
      fprintf(fid,'\\thicklines\n');
      fprintf(fid,'\\put(%d,%d){\\line(%d,%d){%d}}\n',...
         ntp*xsp,(numstate-prevstate)*ysp,xsp/g,...
         ysp*(prevstate-nextstate)/g,xsp);
      fprintf(fid,'\\thinlines\n');
     else
      fprintf(fid,'\\put(%d,%d){\\line(%d,%d){%d}}\n',...
         ntp*xsp,(numstate-prevstate)*ysp,xsp/g,...
         ysp*(prevstate-nextstate)/g,xsp);
     end
     if(firsttime)
      % print the pathcosts
      fprintf(fid,'\\put(%g,%d){\\makebox(0,0){%s %d}}\n',...
         numtoplot*xsp+xpcoff,(numstate-nextstate)*ysp,pathcostfont,...
         pathcost(nextstate));
     end
   end
  end
  minstate = nextminstate;
  firsttime = 0;
  linefromhere = newlinefromhere;
  % print the time labels
  fprintf(fid,'\\put(%d,%g){\\makebox(0,0)[cb]{%s $%d$}}\n',(ntp+1)*xsp,...
     0+timeyoff,timelabelfont,nb);
end
% print the first time label
fprintf(fid,'\\put(0,%g){\\makebox(0,0)[cb]{%s $%d$}}\n',0+timeyoff,...
   timelabelfont,nb-1);
  
if(p)
  [minv,minstate] = min(pathcost);
  fprintf(fid,'\\put(0,%d){\\makebox(0,0){%s}}\n',ysp*(numstate-p),...
     outputchar);
end

fprintf(fid,'\\end{picture}\n');
fprintf(fid,'}\n');