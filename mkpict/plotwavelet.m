% plot the wavelet data
% Copyright 1999 by Todd K. Moon

load ../data/d41;
load ../data/d42;
load ../data/d61;
load ../data/d62;
load ../data/d81;
load ../data/d82;
load ../data/d101;
load ../data/d102;
load ../data/d121;
load ../data/d122;

clf
plotw(d41,d42,3,3,1,[0,3,-2,2],[0,1,2,3],'\phi_4(t)','\psi_4(t)');
print -dps ../pictures/wave4.ps
print -deps ../pictures/wave4.eps

clf
plotw(d61,d62,3,3,1,[0,5,-2,2],[0,1,2,3,4,5],'\phi_6(t)','\psi_6(t)');
print -dps ../pictures/wave6.ps
print -deps ../pictures/wave6.eps

clf
plotw(d81,d82,3,3,1,[0,7,-2,2],[0,1,2,3,4,5,6,7],'\phi_8(t)','\psi_8(t)');
print -dps ../pictures/wave8.ps
print -deps ../pictures/wave8.eps

clf
plotw(d101,d102,3,3,1,[0,9,-2,2],[0,2,4,6,8],'\phi_{10}(t)','\psi_{10}(t)');
print -dps ../pictures/wave10.ps
print -deps ../pictures/wave10.eps

clf
plotw(d121,d122,3,3,1,[0,11,-2,2],[0,2,4,6,8,10],'\phi_{12}(t)','\psi_{12}(t)');
print -dps ../pictures/wave12.ps
print -deps ../pictures/wave12.eps
