%% Problem 1

echo on
% Problem statement:


% Find Q(x)
x=[-6:0.001:6]; q=erfc(x);
PD = 0.75;
closest_vals = abs(q-PD);
min_idx = find(closest_vals == min(closest_vals));
z_d = x(min_idx);

alpha = [];
eta = [];
for z = 0:0.1:3
    d = z + z_d;
    eta = [eta, z*d - (d^2)/2];
    %alpha = [alpha, 0.5*erfc(z/sqrt(2))];
    alpha = [alpha, erfc(z)];
end
figure;
plot(alpha, eta, 'x');
title('\alpha vs. \eta for P_D = 0.75');
ylabel('Threshold (\eta)'); xlabel('Test size (\alpha)');

