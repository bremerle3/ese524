% 
% Data for Bayesian detection on the binary channel

% Copyright 1999 by Todd K. Moon

th1=1;  th2=2;
delta1=1;  delta2=2;
L(th1,delta1) = 0;    L(th1,delta2) = 1;
L(th2,delta1) = 1;   L(th2,delta2) = 0;
x1=1;   x2=2;

phi(1,x1) = 1;   phi(1,x2) = 1;
phi(2,x1) = 1;   phi(2,x2) = 2;
phi(3,x1) = 2;   phi(3,x2) = 1;
phi(4,x1) = 2;   phi(4,x2) = 2;

f(th1,x1) = 3/4;   f(th1,x2) = 1-f(th1,x1);
lambda0 = f(th1,x2);
f(th2,x2) = 2/3;   f(th2,x1) = 1-f(th2,x2);
lambda1 = f(th2,x1);
% compute risk
R(th1,1) = L(th1,phi(1,x1))*f(th1,x1) +  L(th1,phi(1,x2))*f(th1,x2);
R(th1,2) = L(th1,phi(2,x1))*f(th1,x1) +  L(th1,phi(2,x2))*f(th1,x2);
R(th1,3) = L(th1,phi(3,x1))*f(th1,x1) +  L(th1,phi(3,x2))*f(th1,x2);
R(th1,4) = L(th1,phi(4,x1))*f(th1,x1) +  L(th1,phi(4,x2))*f(th1,x2);

R(th2,1) = L(th2,phi(1,x1))*f(th2,x1) +  L(th2,phi(1,x2))*f(th2,x2);
R(th2,2) = L(th2,phi(2,x1))*f(th2,x1) +  L(th2,phi(2,x2))*f(th2,x2);
R(th2,3) = L(th2,phi(3,x1))*f(th2,x1) +  L(th2,phi(3,x2))*f(th2,x2);
R(th2,4) = L(th2,phi(4,x1))*f(th2,x1) +  L(th2,phi(4,x2))*f(th2,x2);

% subplot(2,2,1)
%$$$ line([R(1,4),R(1,2),R(1,1),R(1,3),R(1,4)], [R(2,4),R(2,2),R(2,1),R(2,3),R(2,4)])
%$$$ line([-3 4],[-3 4])
%$$$ line([0 1],[1 0]);
%$$$ line([0 4],[0 0])
%$$$ line([0 0],[0 4])
%$$$ axis equal
%$$$ 
%$$$ q = 3/13;
%$$$ y1 = -5/4*q -3/4;
%$$$ hold on
%$$$ plot(y1,y1,'o')
%$$$ p = 21/26;
%$$$ line([0 p],[0 1-p])
%$$$ print -dps ../pictures/oddeven.ps
%$$$ print -deps ../pictures/oddeven.eps

slope = (R(th2,1) - R(th2,2))/(R(th1,1) - R(th1,2))

% plot the envelope
clf;
subplot(2,2,1)
p = 0:.1:1;
plot(p,p);
hold on
plot(p,(1-p)*lambda0 + p*lambda1,':');
plot(p,(1-p)*(1-lambda0) + p*(1-lambda1),'--');
plot(p,(1-p),'-.');
xlabel('p')
ylabel('r(p,\phi_i)')
int1 = lambda0/(1+lambda0-lambda1);
int2 = (lambda0-1)/(lambda0-1-lambda1);
set(gcf,'DefaultLineLineWidth',1.5)
line([0 int1 int2 1],[0 int1 1-int2 0]);
set(gcf,'DefaultLineLineWidth',.5)
legend('\phi_1','\phi_2','\phi_3','\phi_4')
input('press return to print')
print -dps ../pictures/binchan1.ps
print -deps ../pictures/binchan1.eps
% return

% plot the risk function
clf
subplot(2,2,1);
line([0 lambda0 1 1-lambda0 0],[1 lambda1 0 1-lambda1 1]);
xlabel('R(0,\phi)');
ylabel('R(1,\phi)');
line([0 1],[0,1])
hold on
plot(4/13,4/13,'o')
print -dps ../pictures/binchan2.ps
print -deps ../pictures/binchan2.eps

