% Copyright 1999 by Todd K. Moon

lpy = hmmlpyseqn(y,HMM);                % compute the log-likelihood
lpv = lpy;
hmmnewn = HMM;                  % start with the given HMM
for i=1:4
  hmmnewn = hmmupdaten(y,hmmnewn);      % update the HMM
  lpy = hmmlpyseqn(y,hmmnewn);      % compute the likelihood, and save it
  lpv = [lpv lpy];
end