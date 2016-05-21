mu = 1;
var = 7;
samp_means = [];
for i = 1:100
    x = randn(1,9);
    y = (sqrt(var)).*x+mu;
    samp_mean = sum(x)/9;
    samp_means = [samp_means samp_mean];
end
plot(samp_means);
title('One Hundred Sample Means, mu=1, var=7');
xlabel('Sample Number');
ylabel('Value of Sample Mean');