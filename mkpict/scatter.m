% create a scatter plot to demonstrate principal component
% Copyright 1999 by Todd K. Moon

x1 = [3;1];
x1 = x1/norm(x1);
x2 = [-1,3];
x2 = x2/norm(x2);
P1 = x1*x1';
P2 = x2*x2';
R = 20*P1 + 4*P2;  % create the covariance matrix with the desired properties
L = cholesky(R);
d = randn(200,2); % unit normal data
dn = (L*d')';     % data with specified covariance
subplot(2,2,1);
plot(dn(:,1),dn(:,2),'.');
Rest = cov(dn);   % estimate the covariance matrix
[u,v] = eig(Rest);
% [u,v] = eig(R);
y1  = -u(:,1)*sqrt(v(1,1));
y2 = -u(:,2)*sqrt(v(2,2));
z = [0;0];
axis('equal')
hold on
myquiver(0,0,y1(1),y1(2));
myquiver(0,0,y2(1),y2(2));
%$$$ plot([0,y1(1)],[0,y1(2)],'w');
%$$$ plot([0,y2(1)],[0,y2(2)],'r');
print -dps ../pictures/scatter1.ps
print -deps ../pictures/scatter1.eps
hold off