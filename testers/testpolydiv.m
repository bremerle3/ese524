% test the polynomial division stuff
% Copyright 1999 by Todd K. Moon

B1 = [1 2; 1 3];
B0 = [4 5; 6 7];
B1i = inv(B1);

Q1 = [2 1; -3 4];
Q0 = [6 3; -2 -1];
R = [2 1; -2 3];

% right results
% F = QB+R
F2 = Q1*B1;
F1 = (Q1*B0 + Q0*B1);
F0 = Q0*B0+R;
% right quotient and remainder
Q1r = F2*B1i;
Q0r = (F1-F2*B1i*B0)*B1i;
Rr = F0 - Q0c*B0
% left quotient and remainder
Q1l = B1i*F2;
Q0l = B1i*(F1 - B0*B1i*F2);
Rl = F0 - B0*Q0l
F2l = B1*Q1l;
F1l = (B0*Q1l + B1*Q0l);
F0l = B0*Q0l + Rl
