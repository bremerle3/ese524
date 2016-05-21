E_s = 1;
var = 2;
mu = 2;
npoints = 100;
x = randn(npoints,1);
pdf_p_x = (sqrt(var)*E_s).*x+mu*E_s;
x = randn(npoints,1);
pdf_n_x = (sqrt(var)*E_s).*x-mu*E_s;
pdf_p = normpdf(pdf_p_x, mu, var);
pdf_n = normpdf(pdf_n_x, -mu, var);

figure;
scatter(pdf_p_x, pdf_p);
hold on
scatter(pdf_n_x, pdf_n);
title('N=20, mu=2, var=2, Es=1');
xlabel('Sample Number');
ylabel('Value of Sample Mean');