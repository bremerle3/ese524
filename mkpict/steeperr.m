% Plot errors of the steepest descent
% Copyright 1999 by Todd K. Moon

v1 = [1;1];
v2 = [1; -1];
lambda1 = 100;
lambda2 = 5;
R = v1*v1'* lambda1 + v2*v2'*lambda2;
b = [200;200];
[Q,v] = eig(R);
Q1 = Q(:,1); q2 = Q(:,2);
xstar = R\b;

x = [1;-10];
y = x-xstar;
z = Q*y;
%mu = .004;
%mu = .0051;
xn = zeros(2,1);
numiter = 20;
savez = zeros(2,numiter+1);
savez(:,1) = z;
for i = 1:numiter
  grad = 2*R*x - 2*b;
  xn = x - mu*grad;
  x =xn;
  savez(:,i+1) = Q*(x-xstar);
end
t=0:numiter;
plot(t,savez(1,:));
hold on
plot(t,savez(2,:),'--');
xlabel('iteration number')
ylabel('error in z')
