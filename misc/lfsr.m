function y = lfsr(c,y0,m)
% 
% Produce m outputs of an lfsr with coefficient c and initial values y0
%
% function y = lfsr(c,y0,m)
% y0 = [y_0,...,y_{p-2},y_{p-1}]
% c = [c(1),c(2),...,c(p)]
% 
% y_j = sum_{i=1}^p y_{j-i} c(i)

% Copyright 1999 by Todd K. Moon

p = length(c);
c = c(:);
reg = y0(end:-1:1);  reg = reg(:);
for i=1:m
  y(i) = mod(reg'*c,2);
  reg = [y(i); reg(1:p-1)];
end
