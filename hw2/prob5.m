xbound = 20;
mean = 4;
var = 4;
x = [0:xbound];
%Poisson distribution
pmf1 = poisspdf(x, mean);
figure; scatter(x, pmf1, 'x');
title('Gaussian vs. Poisson');
xlabel('Sample Number');
ylabel('Probability');
%Normal distribution
pmf2 = normpdf(x, mean, var);
hold on
scatter(x, pmf2, 'o');  
%Sum to unity
pmf1_sum = sum(pmf1);
figure; plot(cumsum(pmf1), 'x');   
title('Cum. Prob. of Poisson');
xlabel('Sample Number');
ylabel('Cumulative Probability');

R1 = corrcoef(pmf1, pmf2);
%rho is off-diagonal

%Define random vectors
npoints = 16;
norm_vec = sqrt(var).*randn(npoints,1)+mean;
norm_pdf = normpdf(norm_vec, mean, var);
poisson_vec = poissrnd(mean, npoints,1);
poisson_pdf = poisspdf(poisson_vec, mean);
figure; stem(norm_vec,norm_pdf,'x');
hold on
stem(poisson_vec,poisson_pdf,'o');
R2 = corrcoef(norm_pdf, poisson_pdf);
title('16 Random Normal and Poisson RVs');
xlabel('Sample Number');
ylabel('Probability');
label('Normal', 'Poisson');