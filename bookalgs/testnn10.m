% Test the neural network on a pattern recognition problem
%
% Copyright 1999 by Todd K. Moon


% Make some training data
d = [];  x = [];  xl = 0:.1:1;
for i=1:100
  x1 = rand * 1.4 - .2;  x2 = rand * 1.2; xn = [x1;x2];
  if(x1 < 0 | x1 > 1)
  d1 = .8;
  else
  if(x2 > sin(pi*x1)) d1 = .8; else d1 = .2; end
  end
  d2 = 1-d1;
  d(1,i) = d1;  d(2,i) = d2;
  x = [x xn];
end

% Set up and train the Neural Network
m = [2 5 2];      % numbers of neurons in the layers
mu = .1;  alpha = 0;
[wt,err] = nntrain1(x,d,2,m,mu,alpha);
dnew = [];
for xn = x
  dn = nn1(xn,wt);
  dnew = [dnew dn];
end

% Plot the classification results 
idx = find(dnew(1,:) > dnew(2,:)); 
idx2 = find(dnew(1,:) <= dnew(2,:));
plot(x(1,idx),x(2,idx),'x',x(1,idx2),x(2,idx2),'o',xl,sin(pi*xl),':');
xlabel('x_1'); ylabel('x_2');