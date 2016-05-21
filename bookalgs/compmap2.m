% Run the composite mapping algorithm to make a positive sequence

% Copyright 1999 by Todd K. Moon

% Set up the initial vector
N = 512;   q = 10;   t = (0:q)';
h = 0.54 + 0.46*cos(pi*t/q);               % Hamming window
x = [h; zeros(N-2*q-1,1); h(q+1:-1:2)];  % Conjugate even extension

% Run the composite-mapping algorithm
converged = 0;   numiter = 0;   maxiter = 200;
while (numiter < maxiter)
  numiter = numiter+1
  X = real(fft(x));
  idx = X < 0;
  X(idx) = zeros(size(X(idx)));         % Enforce Property 2: positive sequence
  newx = real(ifft(X));
  newx(q+2:N-q) = zeros(N-2*q-1,1);     % Enforce Property 1: length 2q+1
  if(norm(x-newx) < 1.e-8)              % check for convergence
    break;
  end
  x = newx;
end