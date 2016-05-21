function [V,R] = qrhouse(A)
% 
% Compute the QR factorization of a matrix A without column pivoting
% using Householder transformations
% 
% function [V,R] = qrhouse(A)
%
% 
% A = mxn matrix (assumed to have full column rank)
%
% V = [v1 v2 ... vn] = matrix of Householder vectors 
%           (must be converted to Q ) using qrmakeq.
%           
% R = upper triangular matrix

% Copright 1999 by Todd K. Moon

[m,n] = size(A);
for k=1:n                 % for each column
  % form the Householder vector v for this column
  v = makehouse(A(k:m,k));
  % update the matrix: A <-- H_k A
  A(k:m,k:n) = houseleft(A(k:m,k:n),v);
  % Store the Householder vector information for V
  V(k:m,k) = v;
end
R = A;