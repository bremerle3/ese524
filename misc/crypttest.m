% test the cryptographic example
% Copyright 1999 by Todd K. Moon

p = 7;
q = 11;
r = p*q;
phir = (p-1)*(q-1);
phiphir = 16;
s = 13;

M = 14;
E = res(M,s,r);

t = res(s,(phiphir-1),phir);

D = res(E,t,r)