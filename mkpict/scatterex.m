% create a scatter plot to demonstrate principal component
% Copyright 1999 by Todd K. Moon

x1 = [1;5];
x1 = x1/norm(x1);
x2 = [-5,1];
x2 = x2/norm(x2);
P1 = x1*x1';
P2 = x2*x2';
R = 10*P1 + 2*P2;  % create the covariance matrix with the desired properties
L = cholesky(R);
d = randn(200,2); % unit normal data
dn = (L*d')';     % data with specified covariance
clf 
%subplot(2,2,1);
plot(dn(:,1),dn(:,2),'.');
Rest = cov(dn);   % estimate the covariance matrix
[u,v] = eig(Rest);
y1  = -u(:,1)*sqrt(v(1,1));
y2 = -u(:,2)*sqrt(v(2,2));
z = [0;0];
axis('equal')
hold on
quiver(0,0,y1(1),y1(2),0);
quiver(0,0,y2(1),y2(2),0);
hold off