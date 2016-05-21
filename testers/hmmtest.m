% Test data for the HMM
% Copyright 1999 by Todd K. Moon

HMM.A = [0 1/4 .2;   1 1/4 .4;   0 1/2 .4];
HMM.pi = [1;0;0];
HMM.final = [0 0 1];
HMM.f{1} = 1;   % discrete distribution
HMM.f{2} = [.7 .2 .1
            .2 .5 .2
            .1 .3 .7];
[y,ss] = hmmgendat(8,HMM);

lpy1 = hmmlpyseq(y,HMM)
lpy1n = hmmlpyseqn(y,HMM)
% [alpha,beta,f] = hmmab(y,HMM);
% [alphan,betan,f,c] = hmmabn(y,HMM);
lpv = [lpy1];
hmmnew = HMM;
for i=1:10
  hmmnew = hmmupdate(y,hmmnew);
  lpy2 = hmmlpyseq(y,hmmnew);
  lpv = [lpv lpy2];
end
hmmnewn = HMM;
lpvn = lpy1n;
for i=1:10
  hmmnewn = hmmupdaten(y,hmmnewn);
  lpy2n = hmmlpyseqn(y,hmmnewn);
  lpvn = [lpvn lpy2n];
end