% sysreal.m
% data for the system identification example in the SVD stuff
% Copyright 1999 by Todd K. Moon

%
A =   [ 0    0.2500;  1.0000         0]; % roots at +-.5
b = [1;4];
C = [3 2; 5 1];
h0 = C*b;
h1 = C*A*b;
h2 = C*A^2*b;
h3 = C*A^3*b;
h4 = C*A^4*b;
h5 = C*A^5*b;
h6 = C*A^6*b;
h7 = C*A^7*b;

% the input data:
h0 = [11 9]'; h1 = [5 6]'; h2 = [2.75 2.25]'; h3 = [1.25 1.5]';
h4 = [.6875 .5625]'; h5 = [.3125 .375]'; h6 = [.1719 .1406]';
h7 = [.0781 .0938]';
y = {h0,h1,h2,h3,h4,h5,h6,h7};
[Aest,Best,Cest] = sysidsvd(y);


% noisy input data
h0 = [11.175 8.968]'; h1 = [4.986 6.062]'; h2 = [2.848 2.139]';
h3 = [1.195 1.504]'; h4 =[.439 .678]'; h5 =[.21 .49]'; 
h6 =[.093 .204]'; h7 = [.16 .076]';
ynoise = {h0,h1,h2,h3,h4,h5,h6,h7};
[An,Bn,Cn] = sysidsvd(ynoise,.45)
%$$$ Hn = makehankel([h0 h1 h2 h3 h4 h5 h6],2,3);
%$$$ [u,s,v] = svd(Hn)
%$$$ 
%$$$ Hshift = makehankel([h1 h2 h3 h4 h5 h6],3,3)
%$$$ n = rank(H);
%$$$ m = 2;
%$$$ [U,S,V] = svd(H);
%$$$ P = U';
%$$$ Q = V*pinv(S);
%$$$ temp = (P*H);
%$$$ bnew = temp(1:n,1);
%$$$ temp = H*Q;
%$$$ Cnew = temp(1:m,1:n);
%$$$ temp = (P*Hshift*Q);
%$$$ Anew = temp(1:n,1:n);
