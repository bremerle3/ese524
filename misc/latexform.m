function latexform(fid,X,nohfill)
% 
% Display a matrix X in latex form
%
%function latexform(fid,X,[nohfill])
% 
% fid = output file id (use 1 for terminal display)
% X = matrix of vector to display
% nohfill = 1 if no hfill is wanted
 
% Copyright 1999 by Todd K. Moon

[n,m] = size(X);
if(nargin == 3)
  nohfill = 1;
else
  nohfill = 0;
end
fprintf(fid,'\\begin{bmatrix}');
for i=1:n
  for j=1:m
    if(nohfill)
      fprintf(fid,'%g ',X(i,j));
    else
      fprintf(fid,'\\hfill%g ',X(i,j));
    end
    if(j ~= m) fprintf(fid,'& ');
    end
  end
  if(i ~= n)
    fprintf(fid,'\\\\\n');
  end
end
fprintf(fid,'\\end{bmatrix}\n');