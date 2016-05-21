% Blind source separation example
% Copyright 1999 by Todd K. Moon

n = 3;   % number of sources
A = [0.2309    0.4764    0.3709      % random mixing matrix
    0.5839   -0.6475    0.2338
    0.8436   -0.1886   -0.1795];

s1 = wavread('../data/vm.wav')';     % read the data in
s1 = s1/sqrt(var(s1));     % normalize so all have equal energy to begin
s2 = wavread('../data/ag.wav')';
s2 = s2/sqrt(var(s2));
s3 = wavread('../data/tkm.wav')';
s3 = s3/sqrt(var(s3));

%myplaysnd(s1,8000)         % this plays the result on my machine.
%myplaysnd(s2,8000)         % on most machines, use the 'sound' command
%myplaysnd(s3,8000)


[t,l1] = size(s1);  [t,l2] = size(s2);  [t,l3] = size(s3);
M = min([l1,l2,l3]);       % number of time points
s1 = s1(1:M);  s2 = s2(1:M);  s3 = s3(1:M);
s = [s1;s2;s3];
x = A*s;
for i=1:n                  % play the mixed signals
%  myplaysnd(x(i,:),8000)   
end

% Write out the mixed signals.  Scale the result for writing
sx = x;
for i=1:n
  Mx = max(sx(i,:));   mx = min(sx(i,:));
  sx(i,:) = sx(i,:)/(Mx - mx);
  mx = mean(sx(i,:));  sx(i,:) = sx(i,:) - mx;
  wavwrite(sx(i,:),8000,sprintf('../data/bssin%d.wav',i))
end

numit = 5;                % number of iterations
blocksize = 200;           % number to block together for an update
numblock = M/blocksize;
mu = 0.01;                 % learning rate;
permutetype=2;             % type of "permutation" to use

W = eye(n);                % initial values
W0 = zeros(n,1);
%-----------------------------------------------------------------
% The training loop --- this is where the separation algorithm is actually trained
for i=1:numit
  xp = permutedata(x,permutetype);   % permute the data
  t = 1;
  for nb = 1:numblock
  deltaW = zeros(n,n);
  deltaW0 = zeros(n,1);
  for t1 = 1:blocksize
    xd = xp(:,t);
    y = bssg(W*xd + W0); % compute the output for the current weights
    t = t+1;
    % Compute the change in the weights
    deltaW = deltaW + (ones(n,1)-2*y)*xd';
    deltaW0 = ones(n,1) - 2*y;
  end
  % update the neural net parameters
  deltaW = blocksize*inv(W)' + deltaW;
  W = W + mu*deltaW;
  W0 = W0 + mu*deltaW0;
end
y = W*x; 								% the separated data
for i=1:n
  %  myplaysnd(y(i,:),8000)
  end
end
%-----------------------------------------------------------------
% Write out the separated signals.  Scale the result for writing
for i=1:n
  My = max(y(i,:));   my = min(y(i,:));
  y(i,:) = y(i,:)/(My - my);
  my = mean(y(i,:));  y(i,:) = y(i,:) - my;
  wavwrite(y(i,:),8000,sprintf('../data/bssout%d.wav',i))
end