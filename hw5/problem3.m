d = sqrt(10);
alpha = erfc(d/2)
beta = erfc(-d/2) - 1

%Bayes detector
p0 = 7/16;
p1 = 9/16;
L_01 = 1;
L_10 = 1;
k = (p0*L_01)/(p1*L_10)
eta = log(k)

