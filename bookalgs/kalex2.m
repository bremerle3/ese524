% Kalman filter example 1
%
% Copyright 1999 by Todd K. Moon

x0 = [1;2;1;1];  P0 = 2*eye(4);   % initial position and covariance
Q = 2*eye(4);    R = 3*eye(2);    % state and observation covariance
Qchol = chol(Q)'; Rchol = chol(R)'; % factor to generate the correct noise
delta = 1; 
A = [1 delta 0 0;  0 0 1 delta; 0 1 0 0; 0 0 0 1]; % system matrix
C = [1 0 0 0; 0 1 0 0];           % observation matrix
nsteps = 20;
xt = x0;
[m,n] = size(C);                  % number of state variables(n) and observed(m)

%
xhat = zeros(n,1);                % initial estimate
truex = [];  estx = [];           % arrays to store the true and estimated state
for i=0:nsteps-1
  estx = [estx xhat];             % save solutions
  truex = [truex xt];
  % simulate the system
  yt = C*xt + Rchol*randn(m,1);
  xtp1 = A*xt + Qchol*randn(n,1);
  
  % estimate the state
  [xhat,P0] = kalman1(yt,xhat,P0,A,C,Q,R);
  
  % prepare for the next time around
  %xt = xtp1;
%end
%subplot(2,2,1); 
plot(truex(1,:),truex(2,:),estx(1,:),estx(2,:),':'); hold on; drawnow;
axis square;  xlabel('x_1');  ylabel('x_2'); 
legend('true state','estimated state','location','southeast');
xt = xtp1;
end