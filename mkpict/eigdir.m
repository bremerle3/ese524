% make a contour plot of eigenstuff
% Copyright 1999 by Todd K. Moon


v1 = [3;4]/5;
v2 = [-4;3]/5;
lambda1 = 9;
lambda2 = 1;
R = v1*v1'* lambda1 + v2*v2'*lambda2;
[Q,v] = eig(R);
Q1 = Q(:,1); q2 = Q(:,2);
x0 = [2;1];
stx=-2; endx=2;
sty=-2; endy=2;
x1 = (stx+x0(1):.1:endx+x0(1))';
x2 = (sty+x0(2):.1:endy+x0(2))';
[X1,X2] = meshgrid(x1,x2);
Z = (X1-x0(1)).^2 .* R(1,1) + (X2-x0(2)).^2 .* R(2,2) + 2*(X1-x0(1)).*(X2-x0(2)).*R(1,2);
 
hold off
subplot(2,2,1);
contour(x1,x2,Z,10);
axis('equal');
axis('square');
xlabel('x_1')
ylabel('x_2')
hold on
myquiver(x0(1),x0(2),1,0)
myquiver(x0(1),x0(2),0,1)
text(x0(1)+.9,x0(2)-.4,'y_1')
text(x0(1)-.4,x0(2)+.6,'y_2')
print -dps ../pictures/eigdir1.ps
print -deps ../pictures/eigdir1.eps

clf
subplot(2,2,1);
contour(x1,x2,Z,10);
axis('equal');
axis('square');
hold on
myquiver(x0(1),x0(2),v1(1),v1(2))
myquiver(x0(1),x0(2),v2(1),v2(2))
text(x0(1)+v1(1),x0(2)+v1(2),'z_1')
text(x0(1)+v2(1),x0(2)+v2(2)+.2,'z_2')
xlabel('x_1')
ylabel('x_2')
print -dps ../pictures/eigdir2.ps
print -deps ../pictures/eigdir2.eps