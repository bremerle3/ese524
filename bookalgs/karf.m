function f = karf(x,c)
%
% Evaluate the potential function f(x,c)
% for karmarkers algorithm
%
% function f = karf(x,c)
% 
% x = value of x
% c = constraint vector
%
% f = potential function

% Copyright 1999 by Todd K. Moon

ctx = c'*x;
f = sum( log(ctx ./ x));