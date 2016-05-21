% Test the music algorithm
% Copyright 1999 by Todd K. Moon

j = sqrt(-1);

R = [ 6.4000     -2.7361 + 4.6165*j  -1.5000 - 3.4410*j 1.7361 + 1.0898*j
-2.7361 - 4.6165*j    6.4000   -2.7361 + 4.6165*j  -1.5000 - 3.4410*j 
 -1.5000 + 3.4410*j   -2.7361 - 4.6165*j   6.4000   -2.7361 + 4.6165*j
1.7361 - 1.0898*j  -1.5000 + 3.4410*j  -2.7361 - 4.6165*j   6.4000 ]
[v,u] = eig(R);
f=0:.001:.5;
pf = musicfun(f,3,v);
subplot(2,2,1)
semilogy(f,pf);
axis([0 .5 0 10^10])
xlabel('normalized frequency')
ylabel('P(f)')
print -dps ../pictures/music1.ps
print -deps ../pictures/music1.eps
