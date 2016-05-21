function drawtrellpiece(fname,trellis,branchweight)
%
% Draw a piece of a trellis in LaTeX picture mode
%
% fname = file name
% trellis = trellis description
% branchweight = weights of branches

% Copyright 1999 by Todd K. Moon

fid = fopen(fname,'w');

[numstate,temp] = size(trellis);

unitlen = '.2in';
xsp = 1.5;
ysp = 2;
xoff = -.3;
pathcostfont = '\footnotesize';
timelabelfont = '\tiny';

dotchar = '$\bullet$';
dotchar = '\circle*{0.2}';
xpcoff = .6;
fontsize = '\tiny';

fprintf(fid,'\\setlength{\\unitlength}{%s}\n',unitlen);
fprintf(fid,'\\thinlines');
fprintf(fid,'\\begin{picture}(%g,%g)(%g,%g)\n',xsp+1,...
    (numstate-1)*ysp+1,0,0);
 
fprintf(fid,'\\matrixput(0,0)(%d,0){2}(0,%d){%d}{%s}\n',...
    xsp,ysp,numstate,dotchar);

for state =1:numstate
  branchno = 0;
  for nextstate = trellis(state,:)
    branchno = branchno+1;
    if(nextstate)
      g = gcd(xsp,ysp*(state-nextstate));
      fprintf(fid,'\\put(%d,%d){\\line(%d,%d){%d}}\n',...
          0,(numstate-state)*ysp,xsp/g,...
          ysp*(state-nextstate)/g,xsp);
      s = [];
      for s1 = branchweight{state,branchno}
        s = [s num2str(s1)];
      end
      yoff = (state-nextstate)*ysp* (xoff) + .3;
      fprintf(fid,'\\put(%g,%g){\\makebox(0,0)[r]{%s %s}}\n',...
          xsp+xoff,(numstate-nextstate)*ysp+yoff,fontsize,s);
    end
  end
end 

fprintf(fid,'\\end{picture}\n');