function [lu,indx] = newluround(A,dopivot,digits)
% 
% Compute the lu factorization of A
% controlling the pivoting and the rounding
% dopivot = 1 if piviting desired
% digits = number of decimal places to retain in rounding (digits=3 for 3
% dec. digits)
%
% function [lu,indx] = newluround(A,dopivot,digits)
%
% A = matrix to factor
% dopivot = flag if pivoting desired
% digits = number of digits to retain
%
% lu = matrix containg L and U factors
% indx = index of pivot permutations

% Copyright 1999 by Todd K. Moon

[n,m] = size(A);
if(n ~= m)
   error('Matrix should be square');
end
indx = 1:n;
for k=1:n-1
  if(dopivot)
	% For pivoting, determine largest element in this column (m = index of largest)
	[p,m] = max(abs(A(k:n,k)));
	% The previous index was out of k:n; adjust so it is indexed on 1:n
	m = m+k-1;
	% interchange the kth and mth rows
	dum = A(k,1:n);  A(k,1:n) = A(m,1:n);  A(m,1:n) = dum;
	% record which row the kth row was swapped with
	dum1 = indx(k); indx(k) = indx(m); indx(m) = dum1;
  end
  if(A(k,k) == 0)
    error('linearly dependent columns to machine precision')
  else
    for j=k+1:n
      mult = A(j,k)/A(k,k);
	  % do the row operation
      A(j,k:n) = rdigits(A(j,k:n) - mult*A(k,k:n),digits);
	  % store the multiplier element in the lower triangle
      A(j,k) = mult;
    end
  end
end
lu= A;

