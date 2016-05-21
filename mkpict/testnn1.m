% test the neural network stuff
% Copyright 1999 by Todd K. Moon

L = 4;   % 4 layers
m = [2 3 3 2 3];
% 2 nodes on input layer
% 3 nodes on output layer
% 3 hidden layers
clear w;
w{1} = [1 -2;      % weights for first hidden layer
	    -3 4;
 		5 6];
w{2} = [-.1 .2 -.3;
	    .4 -.5 .6;]; 


%$$$ w{3} = [.9 .8 .7;
%$$$ 	    .6 .5 .4]; % weights for third hidden layer
%$$$ w{4} = [1 .5;
%$$$ 	    .5 -1;
%$$$ 		2  3];     % weights for output layer
xn = [1;2];
% [y,V,Y]  = nn1(xn,w);

% make some training data
d = [];
x = [];
for i=1:100
  x1 = rand * 1.4 - .2;
  x2 = rand * 1.2;
  xn = [x1;x2];
  if(x1 < 0 | x1 > 1)
	d1 = .8;
  else
	if(x2 > sin(pi*x1))
	  d1 = .8;
	else
	  d1 = .2;
	end
  end
  d2 = 1-d1;
  d(1,i) = d1;  d(2,i) = d2;
%$$$   xn = rand(2,1);
%$$$ %  y = nn1(xn,w);
%$$$ %  d(1,i) = y(1);  d(2,i) = y(2);
%$$$   if(xn(1) < xn(2)^4)
%$$$ 	d(1,i) = .8;    d(2,i) = .2;
%$$$   else
%$$$ 	d(1,i) = .1;  d(2,i) = .8;
%$$$   end
  x = [x xn];
end
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
title('(a)')

m = [2 5 2];
mu = .1;
alpha = 0;
w = nnrandw(m);
[wt,err] = nntrain1(x,d,2,m,mu,alpha,3000,w);
errm1a0 = err;
dnew = [];
for xn = x
  dn = nn1(xn,wt);
  dnew = [dnew dn];
end
subplot(2,2,2)
idx = find(dnew(1,:) > dnew(2,:));
plot(x(1,idx),x(2,idx),'x');
idx2 = find(dnew(1,:) <= dnew(2,:));
hold on
plot(x(1,idx2),x(2,idx2),'o');
plot(xl,sin(pi*xl),':')
axis equal
xlabel('x_1')
ylabel('x_2')
title('(b)')

subplot(2,2,3);
plot(err)
xlabel('iteration number')
ylabel('Average squared error')
title('(c)')

subplot(2,2,4)
plot(d(1,:))
hold on
plot(dnew(1,:),':')
xlabel('n (data number)')
ylabel('d(n)')
title('(d)')
