function v = makehouse(x)
%
% Make the Householder vector v such that Hx has zeros in 
% all but the first component
%
% function v = makehouse(x)
%
% x = vector to be transformed
%
% v = Householder vector

% Copyright 1999 by Todd K. Moon

v = x(:);
nv = norm(v);
if(abs(x(1))==nv)
  v = 0*v;
else
  if(v(1))
    v(1) = v(1) + sign(v(1))*nv;
  else
    v(1) = v(1)+nv;
  end
end