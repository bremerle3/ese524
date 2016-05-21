% plot the roc for a gaussian r.v. and its conjugate
% Copyright 1999 by Todd K. Moon

clf
subplot(2,2,1)

d = 1;

Pd = [1];
Pfa = [1];
for nu = .1:.1:10
  Pfa = [Pfa; qf( log(nu)/d + d/2)];
  Pd =  [Pd; qf( log(nu)/d - d/2)];
end
Pd = [Pd; 0];
Pfa = [Pfa; 0];
plot(Pfa,Pd);

hold on

Pdc = [0];
Pfac = [0];
for nu = .1:.1:10
  Pfac = [Pfac; 1-qf( log(nu)/d + d/2)];
  Pdc =  [Pdc; 1-qf( log(nu)/d - d/2)];
end
Pdc = [Pdc; 1];
Pfac = [Pfac; 1];
plot(Pfac,Pdc);

axis equal
axis([0 1 0 1])
xlabel('P_{FA}')
ylabel('P_{D}')
text(.3,.6,'\phi')
text(.72,.3,'1-\phi')

print -dps ../pictures/rocbayes1.ps
print -deps ../pictures/rocbayes1.eps

clf;
subplot(2,2,1);
L01 = .4
L10 = 1.5;
%subplot(2,2,2)
plot(L01*Pfa,L10*(1-Pd));
hold on
plot(L01*Pfac,L10*(1-Pdc))

axis([0 .5 0 2])
xlabel('L_{01}P_{FA} = R(\theta_0,\phi)')
ylabel('L_{10}(1-P_D) = R(\theta_1,\phi)')
print -dps ../pictures/rocbayes2.ps
print -deps ../pictures/rocbayes2.eps