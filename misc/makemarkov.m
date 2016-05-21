function y = makemarkov(A,B,C,n)
% 
% Return the sequence of n impulse response samples into the cell array y
% y{1},y{2}, ... y{n}
%
% function y = makemarkov(A,B,C,n)
%
% (A,B,C) = system
% n = number of samples
%
% y = cell array of impulse responses

% Copyright 1999 by Todd K. Moon

for i=1:n
  y{i} = C*A^(i-1)*B;
end
