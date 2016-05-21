% Test the prony method
% Copyright 1999 by Todd K. Moon

j = sqrt(-1);
r1 = 0.95*exp(j*pi/5);
r2 = 0.95*exp(-j*pi/5);
r3 = 0.92*exp(j*pi/3);
r4 = 0.92*exp(-j*pi/3);

%pd = poly([r1,r2,r3,r4])  % the true polynomial (to test)

p = 4;
A1 = 1;
A2 = .5;
N = 2*p+1;
t = 0:N-1;
x = A1* r1.^t + A1* r2.^t + A2* r3.^t + A2* r4.^t;

[a,r] = newprony(x,4)
clf
subplot(2,2,1);
zplane([],r);

% now the noise
S = A1^2/2 + A2^2/2;   % the signal strength
SNR = 5;
sigma2 = S*10^(-SNR/5);
sigma = sqrt(sigma2);

n = sigma*randn(1,N);
y = x+n;
[a,r] = newprony(y,4);
subplot(2,2,2);
zplane([],r);



print -deps prtest1.eps
