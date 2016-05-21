function rlsinit(m,delta)
%
% Initialize the RLS filter
%
% function rlsinit(m,delta)

% m = dimension of vector
% delta = a small positive constant used for initial correlation inverse

% Copyright 1999 by Todd K. Moon

global hrls;
global Prls;
global xrls;
hrls = zeros(m,1);     % the filter weight
xrls = zeros(m,1);     % the data vector
Prls = 1/delta*eye(m); % the correlation matrix