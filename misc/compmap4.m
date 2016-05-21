% test the positive semi-definite mapping
% Copyright 1999 by Todd K. Moon

B = [8 -3 8
    -3 -2 -7
     8 -7 2];

numiter = 1;
while (numiter < 200)
  [u,v] = eig(B);
  idx = diag(v) > 0;
  u = u(:,idx);
  v = diag(v);
  v = v(idx);
  Bnew = zeros(size(B));
  for i=1:sum(idx)
    Bnew = Bnew + v(i)*u(:,i)*u(:,i)';
  end
  idx = Bnew < 0;
  Bnew(idx) = zeros(size(Bnew(idx)));
  if(norm(B - Bnew) < 1)
    break;
  end
  B = Bnew;
end