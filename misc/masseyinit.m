function masseyinit()
% Initialize the iteratively called massey's algorithm
%
% function masseyinit()

% Copyright 1999 by Todd K. Moon

global Lnmas; global Lmmas; global cmas; global pmas; global smas;
global ymas; global Nmas;

% Initialize the variables

Lnmas = 0;      % current length of LFSR
Lmmas = 0;      % length before last change
cmas = 1;       % feedback connections
pmas = 1;       % c before last change
smas = 1;       % amount of shift
Nmas = 0;
ymas = [];


