% SVD realization
% Copyright 1999 by Todd K. Moon

% the input data:

h0 = [11 9]'; h1 = [5 6]'; h2 = [2.75 2.25]'; h3 = [1.25 1.5]';
h4 = [.6875 .5625]'; h5 = [.3125 .375]'; h6 = [.1719 .1406]';
h7 = [.0781 .0938]';
y = {h0,h1,h2,h3,h4,h5,h6,h7};
[Aest,Best,Cest] = sysidsvd(y);
