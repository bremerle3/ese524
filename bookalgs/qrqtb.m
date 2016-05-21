function [B] = qrqtb(B,V)
% 
% Given a matrix V containing Householder vectors as columns
% (produced using qrhouse), compute Q^H B, where Q is formed (implicitly)
% from the Householder vectors in V.
%
% function [B] = qrqtb(B,V)
% 
% B = matrix to be operated on
% V = matrix of Household vectors (as columns)
%
% output: B = Q^H B

% Copyright 1999 by Todd K. Moon

[m,n] = size(V);
for k=1:n
  v = V(:,k);
  B = houseleft(B,v);  % B <-- H_v B
end