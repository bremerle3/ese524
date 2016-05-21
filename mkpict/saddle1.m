% make a saddle plot 
% Copyright 1999 by Todd K. Moon

x2 = 2;
%$$$ x1 = [-1:.05:1];
%$$$ lambda = [-1:.05:1];
x1 = [-1:.05:1];
lambda = [-1:.05:1];
[X1,Lambda] = meshgrid(x1,lambda);
%X2 = (3*X1+1)/2;
X2 = 1;
J = X1.^2 - Lambda.^2;
%J = 2*X1.^2 + X2.^2 - 2*X1 - 6*X2 + Lambda.*(3*X1 - 2*X2+1);
clf
subplot(2,2,1);

%axis square
mesh(X1,Lambda,J)
%set(gca,'XTick',[]);
%set(gca,'YTick',[]);
%set(gca,'ZTick',[]);
xlabel('x_1');
ylabel('\lambda')
zlabel('L(x_1,\lambda)')

print -dps ../pictures/saddle1.ps
print -deps ../pictures/saddle1.eps
