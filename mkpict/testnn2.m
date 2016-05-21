% test the neural network stuff
% (run testnn1.m first to get the network trained)
%
% does some plots after the initial training is finished

% Copyright 1999 by Todd K. Moon

% the original training data
clf 
subplot(2,2,1)
idx = find(d(1,:) > d(2,:));
plot(x(1,idx),x(2,idx),'x');
idx2 = find(d(1,:) <= d(2,:));
hold on
plot(x(1,idx2),x(2,idx2),'o');
xl = 0:.1:1;
plot(xl,sin(pi*xl),':')
axis equal
xlabel('x_1')
ylabel('x_2')
print -dps ../pictures/nn1out.ps
print -deps ../pictures/nn1out.eps
pause(1)

% the data on the trained network
clf
subplot(2,2,1)
idx = find(dnew(1,:) > dnew(2,:));
plot(x(1,idx),x(2,idx),'x');
idx2 = find(dnew(1,:) <= dnew(2,:));
hold on
plot(x(1,idx2),x(2,idx2),'o');
plot(xl,sin(pi*xl),':')
axis equal
xlabel('x_1')
ylabel('x_2')
print -dps ../pictures/nn2out.ps
print -deps ../pictures/nn2out.eps
pause(1)

% the error in the training curve
clf
subplot(2,2,1)
plot(err)
xlabel('iteration number')
ylabel('Average squared error')
print -dps ../pictures/nn3out.ps
print -deps ../pictures/nn3out.eps
pause(1)

% the output data
subplot(2,2,1)
plot(d(1,:))
hold on
plot(dnew(1,:),':')
xlabel('n (data number)')
ylabel('d(n)')
print -dps ../pictures/nn4out.ps
print -deps ../pictures/nn4out.eps
pause(1)

% generate some new data
xnt = [];
dnt = [];
for i=1:100
  x1 = rand * 1.4 - .2;
  x2 = rand * 1.2;
  xn = [x1;x2];
  xnt = [xnt xn];
end
for xn = xnt
  dn = nn1(xn,wt);
  dnt = [dnt dn];
end
clf
subplot(2,2,1);
idx = find(dnt(1,:) > dnt(2,:));
plot(xnt(1,idx),xnt(2,idx),'x');
idx2 = find(dnt(1,:) <= dnt(2,:));
hold on
plot(xnt(1,idx2),xnt(2,idx2),'o');
plot(xl,sin(pi*xl),':')
axis equal
xlabel('x_1')
ylabel('x_2')
print -dps ../pictures/nn5out.ps
print -deps ../pictures/nn5out.eps
