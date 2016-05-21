% Example for Pisarenko Harmonic Decomposition
% Copyright 1999 by Todd K. Moon

[n,n] = size(Gammayy);
[v,u] = eig(Gammayy);
sigma2 = u(n,n);
vm = v(:,n);               % get eigenvector from smallest eigenvalue
r = roots(vm);             % find roots of the polynomial
f = angle(conj(r))/(2*pi); % get angle and convert to Hz/sample
% Now compute the amplitudes

% Build up the coefficient matrix
for k=1:n-1
   A(k,:) = exp(2*pi*j*k .* f)'
end
r = Gammayy(1,2:n);
P = A\r;
