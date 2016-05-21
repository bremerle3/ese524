function [path] = warp(A,B)
% 
% find the dynamic warping between A and B (which may not be of the
% same length)
%
% function [path] = warp(A,B)
%
% A = cells of the vectors, A{1}, A{2}, ..., A{M}
% B = cells of the vectors, B{1}, B{2}, ..., B{N}
%
% path = Kx2 array of (i,j) correspondence

% Copyright 1999 by Todd K. Moon

M = length(A);
N = length(B);

predi = zeros(M,N);
predj = zeros(M,N);
cost = zeros(2,N);
Q = 5;          % maximum allowable difference between i and j
HUGE = realmax;
curri = 2;
previ = 1;
for i=1:M
  lowerj = max([1,i-Q]);
  upperj = min([N,i+Q]);
  for j=lowerj:upperj
    c = norm(A{i} - B{j})
    c1 = HUGE; c2=HUGE; c3=HUGE;
    if(i == 1 & j==1)                   % no predecessors
      cost(2,j) = c;
      predi(i,j) = 1; predj(i,j) = 1;
    elseif(i==1)                        % only j predecessors
      c3 = cost(curri,j-1)+c;
      cost(2,j) = c3;
      predi(i,j) = i; predj(i,j) = j-1;
    elseif(j==1)                        % only i predecessors
      c1 = cost(previ,j)+c;
      cost(2,j) = c1;
      predi(i,j) = i-1; predj(i,j) = j;
    else                                % check predecessors
      if(predi(i-1,j) | predj(i-1,j)) c1 = cost(previ,j)+c; end;
      if(predi(i-1,j-1) | predj(i-1,j-1)) c2 = cost(previ,j-1)+c; end;
      if(predi(i,j-1) | predj(i,j-1)) c3 = cost(curri,j-1)+c; end;
      if(c1 >= HUGE & c2 >= HUGE & c3 >= HUGE) 
        predi(i,j) = 0; predj(i,j) = 0;
      elseif(c1 < c2 & c1 < c3)
        cost(curri,j) = c1;
        predi(i,j) = i-1; predj(i,j) = j;
      elseif(c2<=c1 & c2 <= c3)
        cost(curri,j) = c2;
        predi(i,j) = i-1; predj(i,j) = j-1;
      else
        cost(curri,j) = c3;
        predi(i,j) = i; predj(i,j) = j-1;
      end                               % end if-else
    end;                                % end if-else
  end                                   % end loop j
  curri = 3-curri;                      % "shift costs down"
  previ = 3-previ;
end;                                    % end loop on i

tcost = cost(previ,N);

% now work backward from the final point to find the path

i = M;
j = N;
%kk = pfunc(M,N);
path = [];
for k=1:M+N-1
  path(k,1) = i;  path(k,2) = j;
  if(i==1 & j==1)
    break;
  end
  newi = predi(i,j); newj =predj(i,j);
  i = newi; j = newj;
end;  % end loop on k
% reverse the path list
path = path(length(path):-1:1,:);