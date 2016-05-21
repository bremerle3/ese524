% test the solution of a moving RHS in the equation Ax=b
% Copyright 1999 by Todd K. Moon

numtime = 200;
xj = zeros(3,1);
xgs = zeros(3,1);
savexj = zeros(3,numtime);
savexgs = zeros(3,numtime);
savex = zeros(3,numtime);

om1 = 0.05;
om2 = 0.1;
om3 = 0.2;
A0 = [4 2 -1;
     1 6 -2;
     4 -3 9];
for t=1:numtime
  b = [2 + 5*cos(om1*t); 4 - 3*cos(om2*t); 7 + 2*cos(om3*t)];
  A = A0 + [cos(om1*t) cos(om2*t) cos(om3*t); cos(om1*t) cos(om2*t) cos(om3*t);
            cos(om1*t) cos(om2*t) cos(om3*t)];
  xtrue = A\b;
  savex(:,t) = xtrue;
  xj = jacobi(A,xj,b);
  savexj(:,t) = xj;
  xgs = gaussseid(A,xgs,b);
  savexgs(:,t) = xgs;
end
tl = 1:numtime;
 
% plot true and Jacobi
clf; subplot(2,2,1);
plot(tl,savex(1,:),tl,savex(2,:),'--',tl,savex(3,:),':');
hold
% plot(tl,savexj(1,:),'-.',tl,savexj(2,:),'-.',tl,savexj(3,:),'-.');
xlabel('iteration');
ylabel('x_1, x_2, x_3');
% text(20,-1.15,'(a) True and Jacobi','HorizontalAlignment','center');
legend('x_1','x_2','x_3')
i1 = input('position the legend');
print -dps ../pictures/mi1.ps
print -deps ../pictures/mi1.eps
pause(1)

clf; subplot(2,2,1);
%subplot(2,2,2);
plot(tl,savexj(1,:),tl,savexj(2,:),'--',tl,savexj(3,:),':');
xlabel('iteration');
ylabel('x_1, x_2, x_3');
print -dps ../pictures/mi2.ps
print -deps ../pictures/mi2.eps
pause(1)

clf; subplot(2,2,1);
%subplot(2,2,3);
plot(tl,savexgs(1,:),tl,savexgs(2,:),'--',tl,savexgs(3,:),':');
xlabel('iteration');
ylabel('x_1, x_2, x_3');
print -dps ../pictures/mi3.ps
print -deps ../pictures/mi3.eps
pause(1)
 
clf; subplot(2,2,1);
ej = (savex(1,:)-savexj(1,:)).^2+(savex(2,:)-savexj(2,:)).^2+(savex(3,:) - savexj(3,:)).^2 ;
eg = (savex(1,:)-savexgs(1,:)).^2+(savex(2,:)-savexgs(2,:)).^2+(savex(3,:) - savexgs(3,:)).^2 ;
semilogy(tl,ej, tl,eg,':');
xlabel('iteration');
ylabel('||x - xhat||^2');
legend('Jacobi','Gauss-Seidel')
i1 = input('position the legend');
print -dps ../pictures/mi4.ps
print -deps ../pictures/mi4.eps