% Test the wavelet transform in wavelet notation (alternate indexing)

wavecoeff;                           % set up the coefficients
h = d4coeff;
g = [h(4) -h(3) h(2) -h(1)];


L = [h(3) h(4) 0    0    0    0      % first stage        % this one works
     h(1) h(2) h(3) h(4) 0    0
   0    0    h(1) h(2) h(3) h(4)
   0    0    0    0    h(1) h(2)];
H = [g(3) g(4) 0    0    0    0
     g(1) g(2) g(3) g(4) 0    0
   0    0    g(1) g(2) g(3) g(4)
   0    0    0    0    g(1) g(2)];

c = [1 2 3 4 5 6]';
c1 = L*c;                           % transform
d1 = H*c;
c0new = L'*c1 + H'*d1

L1 = [h(3) h(4) 0    0          % this one works length(c1)=4
      h(1) h(2) h(3) h(4)
      0    0    h(1) h(2)];

H1 = [g(3) g(4) 0    0
      g(1) g(2) g(3) g(4)
      0    0    g(1) g(2)];
  
c2 = L1*c1;
d2 = H1*c1;
% the wavelete transform is [d1 d2 c2].
% now reconstruct from the wavelet transform data
c1new = L1'*c2 + H1'*d2;
diff = c1-c1new
c0new = L'*c1new + H'*d1