% test the neural network stuff
% try different values of mu and alpha
% run testnn1 first to get the training data

% Copyright 1999 by Todd K. Moon

mu = .1;
alpha = 0;
[wt,err] = nntrain1(x,d,2,m,mu,alpha,3000,w);
errmu1a0 = err;
disp('mu=.1, alpha=0 done')


mu = 0.1;
alpha = .5;
[wt,err] = nntrain1(x,d,2,m,mu,alpha,3000,w);
errmu1a5 = err;
disp('mu=.1, alpha=.5 done')

mu = 0.1;
alpha = .9;
[wt,err] = nntrain1(x,d,2,m,mu,alpha,3000,w);
errmu1a9 = err;
disp('mu=.1, alpha=.9 done')

mu = 0.5;
alpha = 0;
[wt,err] = nntrain1(x,d,2,m,mu,alpha,3000,w);
errmu5a0 = err;
disp('mu=.5, alpha=0 done')

mu = 0.5;
alpha = .5;
[wt,err] = nntrain1(x,d,2,m,mu,alpha,3000,w);
errmu5a5 = err;
disp('mu=.5, alpha=.5 done')
 
mu = 0.5;
alpha = .9;
[wt,err] = nntrain1(x,d,2,m,mu,alpha,3000,w);
errmu5a9 = err;
disp('mu=.5, alpha=.9 done')


clf
subplot(2,2,1);
plot(1:1000,errm1a0(1:1000),'r',1:1000,errmu1a5(1:1000),'g')
xlabel('iteration number')
ylabel('E_{av}')
legend('\mu=.1, \alpha=0','\mu=.1, \alpha=.5')
print -dps ../pictures/nnp1.ps
print -deps ../pictures/nnp1.eps
pause(1);

clf
subplot(2,2,1);
% subplot(2,2,2);
plot(1:1000,errmu5a0(1:1000),'r',1:1000,errmu5a5(1:1000),'g')
xlabel('iteration number')
ylabel('E_{av}')
legend('\mu=.5, \alpha=0','\mu=.5, \alpha=.5')
print -dps ../pictures/nnp2.ps
print -deps ../pictures/nnp2.eps
pause(1);

clf
subplot(2,2,1);
% subplot(2,2,3);
plot(1:1000,errm1a0(1:1000),'r',1:1000,errmu5a0(1:1000),'g')
xlabel('iteration number')
ylabel('E_{av}')
legend('\mu=.1, \alpha=0','\mu=.5, \alpha=0')
print -dps ../pictures/nnp3.ps
print -deps ../pictures/nnp3.eps
pause(1);

clf
subplot(2,2,1);
% subplot(2,2,4);
plot(1:1000,errmu1a5(1:1000),'r',1:1000,errmu5a5(1:1000),'g')
xlabel('iteration number')
ylabel('E_{av}')
legend('\mu=.1, \alpha=.5','\mu=.5, \alpha=.5')
print -dps ../pictures/nnp4.ps
print -deps ../pictures/nnp4.eps
pause(1);

%$$$ plot(errmu1a0,'r')
%$$$ hold on
%$$$ plot(errmu1a5,'g')
%$$$ % plot(errmu1a9,'b')


