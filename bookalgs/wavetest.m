% Test the wavelet transform in matrix notation

wavecoeff;                           % set up the coefficients
h = d4coeff;
g = [h(4) -h(3) h(2) -h(1)];

L = [h(4) 0    0    0    0    0      % first stage
     h(2) h(3) h(4) 0    0    0
   0    h(1) h(2) h(3) h(4) 0
   0    0    0    h(1) h(2) h(3)
     0    0    0    0    0    h(1)];
H = [g(4) 0    0    0    0    0      % first stage
     g(2) g(3) g(4) 0    0    0
   0    g(1) g(2) g(3) g(4) 0
   0    0    0    g(1) g(2) g(3)
     0    0    0    0    0    g(1)];

c0 = [1 2 3 4 5 6]';
c1 = L*c0;                           % transform
d1 = H*c0;

L1 = [h(3) h(4) 0    0    0
      h(1) h(2) h(3) h(4) 0
      0    0    h(1) h(2) h(3)
    0    0    0    0    h(1)];

H1 = [g(3) g(4) 0    0    0
      g(1) g(2) g(3) g(4) 0
      0    0    g(1) g(2) g(3)
    0    0    0    0    g(1)];

c2 = L1*c1;
d2 = H1*c1;
% the wavelete transform is [d1 d2 c2].
% now reconstruct from the wavelet transform data
c1new = L1'*c2 + H1'*d2;
c0new = L'*c1new + H'*d1