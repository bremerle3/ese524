function h = H(p)
% 
% Compute the binary entropy function
% 
% function h = H(p)
%
% p = crossover probability
%
% h = binary entropy

% Copyright 1999 by Todd K. Moon

i1 = find(p==0 | p==1);
i2 = find(p ~=0 & p ~= 1);
h(i1) = zeros(size(i1));
h(i2) = -(p(i2) .* log2(p(i2)) + (1-p(i2)) .* log2(1-p(i2)));

