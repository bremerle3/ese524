function x = sor(A,x,b,omega)
% 
% Produce an updated solution x to Ax = b successive over-relaxation
% A must be Hermitian positive definite
%
% function x = sor(A,x,b)
%
% A = input matrix
% x = initial solution
% b = right-hand side
% omega = relaxation parameter
% 
% Output x= updated solution

% Copyright 1999 by Todd K. Moon

[m,n] = size(A); if(n ~= m) error('Error: matrix needs to be square'); end;
D = diag(diag(A));  Cl = tril(A,-1);  Cu = triu(A,1);
% the following should be set up and stored if this is used iteratively
omegaQ = D + omega*Cl;                   % omega * Q
omegaQmA = (1-omega)*D - omega*Cu;       % omega * (Q-A)
% The update step:
x = backsub(omegaQ, omegaQmA*x + omega*b);