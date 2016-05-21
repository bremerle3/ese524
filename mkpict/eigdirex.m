% make a contour plot of eigenstuff
% Copyright 1999 by Todd K. Moon

R = [5.15385 -3.23077; -3.23077 7.84615];

%R = inv(R);               % uncomment this line to get level curves for inv(R)

[ur,vr] = eig(R)

[Q,v] = eig(R);
Q1 = Q(:,1); q2 = Q(:,2);
x0 = [0;0];        % center point
stx=-2; endx=2;
sty=-2; endy=2;
x1 = (stx+x0(1):.1:endx+x0(1))';
x2 = (sty+x0(2):.1:endy+x0(2))';
[X1,X2] = meshgrid(x1,x2);
Z = (X1-x0(1)).^2 .* R(1,1) + (X2-x0(2)).^2 .* R(2,2) + 2*(X1-x0(1)).*(X2-x0(2)).*R(1,2);
 
clf
subplot(2,2,1);
contour(x1,x2,Z,10);
axis('equal');
axis('square');
hold on
scf = 0.2;
%scf = 1/scf;                % uncomment to scale for inv(R)
quiver(x0(1),x0(2),ur(1,1)*vr(1,1)*scf,ur(2,1)*vr(1,1)*scf,0)
quiver(x0(1),x0(2),ur(1,2)*vr(2,2)*scf,ur(2,2)*vr(2,2)*scf,0)
text(x0(1)+ur(1,1),x0(2)+ur(2,1),'z_1')
text(x0(1)+ur(1,2),x0(2)+ur(2,2)+.2,'z_2')
xlabel('x_1')
ylabel('x_2')
% 
% Output: comment as appropriate for R or inv(R)
print -dps ../pictures/eigdirex1.ps
print -deps ../pictures/eigdirex1.eps
%print -dps ../pictures/eigdirex2.ps
%print -deps ../pictures/eigdirex2.eps
