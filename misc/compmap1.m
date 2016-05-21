% Test the composite mapping algorithm on the positive sequence
% Copyright 1999 by Todd K. Moon

N = 512;
q = 10;
t = (0:q)';
h1 = 0.5 + 0.5*cos(pi*t/q);          % Hanning
h2 = 0.54 + 0.46*cos(pi*t/q);        % Hamming
h3 = 1- t./q;                         % Bartlett
h4 = 0.42 + 0.5*cos(pi*t/q) + .08*cos(2*pi*t/q);  % Blackman

beta = 6;
h5 = besseli(0,beta*sqrt(1-  (t/q).^2))/besseli(0,beta);

x1 = [h1; zeros(N-2*q-1,1); h1(q+1:-1:2)];
x2 = [h2; zeros(N-2*q-1,1); h2(q+1:-1:2)];
x3 = [h3; zeros(N-2*q-1,1); h3(q+1:-1:2)];
x4 = [h4; zeros(N-2*q-1,1); h4(q+1:-1:2)];
x5 = [h5; zeros(N-2*q-1,1); h5(q+1:-1:2)];
X1 = fft(x1);
X2 = fft(x2);
X3 = fft(x3);
X4 = fft(x4);
X5 = fft(x5);

plot(real(X1));
hold on
plot(real(X2));
plot(real(X3));
plot(real(X4),'r');
plot(real(X5),'w');
[min(real(X1)) min(real(X2)) min(real(X3)) min(real(X4)) min(real(X5)) ]

h = h2;
x = x2;
converged = 0;
numiter = 0;
while ~converged
  numiter = numiter+1
  X = real(fft(x));
  idx = X < 0;
  X(idx) = zeros(size(X(idx)));
  newx = real(ifft(X));
  newx(q+2:N-q) = zeros(N-2*q-1,1);
  if(norm(x-newx) < 1.e-8)
    converged = 1;
  end
  x = newx;
end