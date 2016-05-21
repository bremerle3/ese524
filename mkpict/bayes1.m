% Bayes decision tests

% Copyright 1999 by Todd K. Moon

L00 = 0;  L01 = 5;
L10 = 10; L11 = 0;

tau = 0:.1:1;
 
L1 = L10;
L0 = L01;

R1 = L1* 1/3*tau ./(3/4*(1-tau) + 1/3*tau);
R2 = L0*3/4*(1-tau)./ (3/4*(1-tau) + 1/3*tau);
subplot(2,2,1);
plot(tau,R1,tau,R2,':')
L1 = L11;
L0 = L01;
title('x=x_1')
xlabel('p')
ylabel('r(p,\phi)')
legend('\phi=0','\phi=1')
hold on

L1 = L10;
L0 = L01;

R1 = L1* 2/3*tau ./(1/4*(1-tau) + 2/3*tau);
R2 = L0*1/4*(1-tau) ./ (1/4*(1-tau) + 2/3*tau);
subplot(2,2,2);
plot(tau,R1,tau,R2,':')
title('x=x_0')
xlabel('p')
ylabel('r(p,\phi)')
legend('\phi=0','\phi=1')
input('press return to save')
print -dps ../pictures/bayes1.ps
print -deps ../pictures/bayes1.eps

input('press return for next plot')
  
clf
subplot(2,2,1)
line([0 3/19],[0,10*3/19]);
line([3/19 9/17],[10*3/19 (5/4 + 25/12 * 9/17)]);
line([9/17 1],[(5/4 + 25/12 * 9/17) 0])
xlabel('p')
ylabel('r(p,\phi)')
print -dps ../pictures/bayes3.ps
print -deps ../pictures/bayes3.eps