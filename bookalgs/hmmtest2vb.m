% Test the HMM using both Viterbi and EM-algorithm based training methods

% Copyright 1999 by Todd K. Moon

HMM.A = [0 1/4 .2;   1 1/4 .4;   0 1/2 .4];
HMM.pi = [1;0;0];        HMM.final = [0 0 1];
HMM.f{1} = 2;   % Gaussian distribution
HMM.f{2,1} = [1;1;1];    HMM.f{2,2} = [-1;-1;-1];    HMM.f{2,3} = [5;5;5];
HMM.f{3,1} = .5*eye(3);  HMM.f{3,2} = .6*eye(3);     HMM.f{3,3} = .7*eye(3);

hmminitvit(HMM,10);             % initialize the Viterbi stuff
[y,ss] = hmmgendat(8,HMM);      % generate some test data

lpy1 = hmmlpyseqn(y,HMM);       % find the "any path" likelihood
lpyv1 = hmmlpyseqv(y,HMM);      % find the "best path" likelihood

% 11 = EM trained, any path   12 = EM trained, best path
% 21 = VA trained, any path   22 = VA trained, best path
lp11 = lpy1;
lp21 = lpy1;
lp12 = lpyv1;
lp22 = lpyv1;
hmmnew = HMM;                    % prepare to train using EM and VA methods
hmmnewv = HMM;
for i=1:4
  hmmnew = hmmupdaten(y,hmmnew); % update using EM algorithm
  hmmnewv = hmmupdatev(y,hmmnewv);% update using VA methods
  hmminitvit(hmmnewv,10);        % reset the VA to use this new model
  lpy11 = hmmlpyseqn(y,hmmnew);  % compute the sequence likelihood in each case
  lpy12 = hmmlpyseqv(y,hmmnew);
  lpy21 = hmmlpyseqn(y,hmmnewv);
  lpy22 = hmmlpyseqv(y,hmmnewv);
  lp11 = [lp11 lpy11];
  lp12 = [lp12 lpy12];
  lp21 = [lp21 lpy21];
  lp22 = [lp22 lpy22];
end