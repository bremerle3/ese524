%Load up the image
load('bseratio41.mat');
%Display ratio colormap
figure;imagesc(bseratio41); %Display w/ scaled colors
s = sprintf('BSE Ratio @ 41%cC', char(176));title(s);
xlabel('Lateral');ylabel('Axial');
colormap jet
colorbar
%Display dB colormap
figure;imagesc(20*log10(bseratio41)); %Display w/ scaled colors
s = sprintf('BSE Ratio in dB @ 41%cC', char(176));title(s);
xlabel('Lateral');ylabel('Axial');
colormap jet
colorbar
%Make histogram
imVec=reshape(20*log10(bseratio41),1,[]); 
nbins=500;
%histfit(pdf1',nbins, 'normal')



[f,x]=hist(imVec', nbins);
dx=diff(x(1:2));
%pdf1=(f./sum(f)/dx);
pdf1=(f./sum(f*dx));
figure;bar(x,pdf1);title('BSE Ratio Histogram');
%figure;bar(x,f);title('BSE Ratio Histogram');
%Check probability axioms
hist_sum=sum(pdf1*dx);


%Fit to normal pdf
norm_pd=fitdist(pdf1', 'normal');
norm_pd.sigma = 1.63;
x_vals = x;
y_vals1=pdf(norm_pd,x_vals);
figure;plot(x_vals,y_vals1);title('BSE Ratio Fit to Normal');
s = sprintf('BSE Ratio @ 41%cC', char(176));
xlabel(s);
ylabel('Probability Density');
%Plot together
figure;bar(x,f./sum(f));title('Hist vs. Normal Fit');
hold on
plot(x_vals,y_vals1./sum(y_vals1));
RMSE_norm = sqrt(mean((y_vals1 - pdf1).^2));

%Fit to kernel pdf
kern_pd=fitdist(pdf1', 'Kernel');
kern_pd.BandWidth = 1.63;
x_vals = x;
y_vals2=pdf(kern_pd,x_vals);
figure;plot(x_vals,y_vals2);title('BSE Ratio Fit to Kernel');
s = sprintf('BSE Ratio @ 41%cC', char(176));
xlabel(s);
ylabel('Probability Density');
%Plot together
figure;bar(x,f./sum(f));title('Hist vs. Kernel Fit');
hold on
plot(x_vals,y_vals2./sum(y_vals2));
RMSE_kern = sqrt(mean((y_vals2 - pdf1).^2));

%Fit to T pdf
T_pd=fitdist(pdf1', 'tLocationScale');
T_pd.sigma = 1.7;
x_vals = x;
y_vals3=pdf(T_pd,x_vals);
figure;plot(x_vals,y_vals3);title('BSE Ratio Fit to T');
s = sprintf('BSE Ratio @ 41%cC', char(176));
xlabel(s);
ylabel('Probability Density');
%Plot together
figure;bar(x,f./sum(f));title('Hist vs. T Fit');
hold on
plot(x_vals,y_vals3./sum(y_vals3));
RMSE_T = sqrt(mean((y_vals3 - pdf1).^2));

%Plot all together
figure;
bar(x,f./sum(f));
hold on
plot(x_vals, y_vals1./sum(y_vals1));
hold on
plot(x_vals, y_vals2./sum(y_vals2));
hold on
plot(x_vals, y_vals3./sum(y_vals3));
legend('Data','Normal', 'Kernel', 'T');
title('All Candidate PDFs');
xlabel(s);
ylabel('Probability Density');



