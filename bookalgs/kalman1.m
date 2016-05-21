function [xhat,P] = kalman1(y,x0,P0,A,C,Q,R)
% 
% Computes the Kalman filter esimate xhat(t+1|t+1)
% for the system x(t+1) = Ax(t) + w
%                y(t) = Cx(t) + v
% where cov(w) = Q  and cov(v) = R, 
% The prior estimate is x0, and the prior covariance is P0.
% 
%(By passing in (A,B,C,Q,R) each time, the possibility of a time-varying
% system is accomodated, at the expense of some computational efficiency.)
% 
% function [xhat,P] = kalman1(y,x0,P0,A,C,Q,R)
%
% y = observation y(t)
% x0 = prior estimate
% P0 = prior covariance
% A = system matrix
% C = observation matrix
% Q = covariance of state noise
% R = covariance of observation noise
%
% xhat = estimate
% P = covariance of estimate

% Copyright 1999 by Todd K. Moon

n = length(x0);                         % size of state variable
% update step
xtp1t = A*x0;                          % xhat(t+1|t)
Ptp1t = A*P0*A' + Q;                   % P(t+1|t)
% propagate step
K = Ptp1t*C'*inv(C*Ptp1t*C' + R);
P = (eye(n,n) - K*C)*Ptp1t;            % P(t+1|t+1)
xhat = (eye(n,n) - K*C)*xtp1t  + K*y;  % xhat(t+1|t+1)