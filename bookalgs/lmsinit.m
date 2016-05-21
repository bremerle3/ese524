function lmsinit(m,mu)
%
% Initialize the LMS filter
% 
% function lmsinit(m,mu)
%
% m = dimension of vector
% mu = lms stepsize

% Copyright 1999 by Todd K. Moon

global hlms;
global mulms;
global xlms;
hlms = zeros(m,1);     % the filter weight
xlms = zeros(m,1);     % the data vector
mulms = mu;