function [h,X] = lsfilt(f,d,m,type)
%
% Determine a least-squares filter h with m coefficients 
%
% function [h,X] = lsfilt(f,d,m,type)
%
% f = input data
% d = desired output data
% m = order of filter
% type = data matrix type
%     type=1: "covariance" method    2: "autocorrelation" method
%          3: prewindowing           4: postwindowing
%
% h = least-squares filter
% X = (optional) data matrix

% Copyright 1999 by Todd K. Moon

X = [];                                 % clear the data matrix
N = length(f);
f = f(:);     d = d(:);                 % turn into column vectors
% build the data matrix
if(type==2 | type == 3)                 % prewindowed data
  for i=1:m-1
    X = [X;[f(i:-1:1) zeros(1,m-i)]];
  end
end
for i=m:N
  X = [X;f(i:-1:i-m+1)'];
end
if(type==2 | type==4)                   % postwindowed data
  for i=1:m-1
    X = [X;[zeros(1,i) f(N:-1:N-m+i+1)']];
  end
end
% Find the least-squares solution using the pseudo-inverse
h = pinv(X)*d;               % compute least-squares solution