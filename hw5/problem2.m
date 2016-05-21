%%
%Problem 2

echo on
% Problem statement: Consider hypotehsis test with H0: x~N[s0, sigma^2*I] and  
% H1: x~N[s1, sigma^2*I], Assume L00=L11=0 and L01=2*L10. Determine alpha,
% beta, eta, and k for a minimax test. Carry out computations for d^2 =
% (s1-s0)T(s1-s0)/sigma^2 = 0.1 and 10. For both cases, determine nature's
% least favorable prior.
echo off

%%
% For d^2 = 0.1:

d = sqrt(0.1);
z=[-1:0.0001:1]; 
q1=2*erf(z);
q2=erf(z - d);

closest_val = abs(q1+q2-2);
min_idx = find(closest_val == min(closest_val));
min_z = z(min_idx);

eta = min_z*d - (d^2)/2
alpha = 1 - erf(min_z)
beta = 1 -2*alpha
k = exp(eta)
echo on 
% Nature's least favorable prior:
echo off
p = k/(2+k)

%%
% For d^2 = 10:

d = sqrt(10);
z=[-1:0.0001:1]; 
q1=2*erf(z);
q2=erf(z - d);

closest_val = abs(q1+q2-2);
min_idx = find(closest_val == min(closest_val));
min_z = z(min_idx);

eta = min_z*d - (d^2)/2
alpha = 1 - erf(min_z)
beta = 1 -2*alpha
k = exp(eta)
echo on 
% Nature's least favorable prior:
echo off
p = k/(2+k)
