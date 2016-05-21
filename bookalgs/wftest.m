% Test the Wiener filter equalizer for a first-order signal and first-order
% channel

% This script provides a test vehicle for the first-order Wiener filter

% Copyright 1999 by Todd K. Moon

% The AR model for the desired signal:
a1d = .5;         % feedback gain
sigmanu2 = 0.1;   % input noise variance
% channel output noise model:
sigman2 = 0.16    % additive output noise variance
% The all-pole channel model
a2d = -.6
% the overall response 
a = conv([1 a1d],[1 a2d])
a1 = a(2);
a2 = a(3);
% correlation parameters
ru0 = (1+a2)/(1-a2)*sigmanu2/((1+a2)^2 - a1^2);
sigmau2 = ru0;
ru1 = -a1/(1+a2)*sigmau2
Ruu = [ru0 ru1; ru1 ru0]
Rnn = sigman2*eye(2);
Rff = Ruu + Rnn;
% cross-correlation parameters
p0 = ru0 + a2d*ru1
p1 = ru1 + a2d*ru0
p = [p0;p1]
h = Rff\p
% find the min. error
sigmad2 = sigmanu2/(1-a1d^2);
e2min = sigmad2 - p'*h