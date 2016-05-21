function [Anew,cnew] = tokarmarker(A,b,c)
% 
% Given a linear programming problem in standard form
%  min       c'x
% subject to Ax = b,  x >= 0
%
% return new values of A and c in "Karmarker standard form"
%  min       c'x
% subject to Ax=0,  sum(x)=n, x >= 0
%
% function [Anew,cnew] = tokarmarker(A,b,c)
%
% (A,b,c) = matrices in standard form
%
% Anew, cnew = matrices in Karmarker standard form

% Copyright 1999 by Todd K. Moon

A = [A;-A];
b = [b;-b];
[m,n] = size(A);
x0 = ones(n,1);  y0 = ones(m,1);  u0 = ones(m,1);   v0 = ones(n,1);

% Incorporate dual variables and slack variables
Anew = [A          zeros(m,m)  -eye(m,m)   zeros(m,n) (b - A*x0 + y0)
      zeros(n,n) A'          zeros(n,m)  eye(n,n)   (c - A'*u0 - v0)
    c'         -b'         zeros(1,m)  zeros(1,n) (-c'*x0 + b'*u0)];
cnew = [zeros(2*(m+n),1); 1];
bnew = [b;c;0];

% Now the projective transformation
Anew = [Anew -bnew];
cnew = [cnew;0];