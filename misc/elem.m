function E = elem(r,s,m,n)
%
% Return an elementary matrix E_{rs} of size mxn
 
% Copyright 1999 by Todd K. Moon


E = zeros(m,n);
E(r,s) = 1;
