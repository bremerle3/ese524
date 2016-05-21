% Generate random Gaussian data, determine a codebook for it, and plot

dim = 2; %signal dimension
npoints = 500; % number of points
ncluster = 16; % number of VQ clusters

% attributes of the covariance matrix
v1 = [1;1];
v2 = [1; -1];
lambda1 = 100;
lambda2 = 10;
R = v1*v1'* lambda1 + v2*v2'*lambda2;
C = (chol(R))';

X = randn(dim,npoints);
Y = C*X;   % the data with the desired covariance

clf
subplot(2,2,1);
plot(Y(1,:),Y(2,:),'.');
xlabel('x_1');
ylabel('x_2');
%text(0,-60,'(a)','HorizontalAlignment','center');
print -dps ../pictures/vq1a.ps
print -deps ../pictures/vq1a.eps
input('press return')

VQ = lgb(Y,ncluster);
clf
subplot(2,2,1);
%plot(Y(1,:),Y(2,:),'.');
%hold
plot(VQ(1,:),VQ(2,:),'x');
xlabel('x_1');
ylabel('x_2');
%text(0,-60,'(b)','HorizontalAlignment','center');
print -dps ../pictures/vq1b.ps
print -deps ../pictures/vq1b.eps


