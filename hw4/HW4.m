clear;clc

%% PROBLEM 3
%% a
N = 10;
alpha = 0.1;
t0 = 0.2;
t1 = 0.25;
q = @(n) (n-N*log((1-t1)/(1-t0)))/(log(t1/t0)-log((1-t1)/(1-t0)));
fun = @(k,p) nchoosek(N,k)*p^k*(1-p)^(N-k);

for k = 0:N
    aa = 0;
    for i = 0:k
        aa = aa + fun(i,t0);
    end
    if aa > (1-alpha)
        break
    end
end
qhat = k
aa
gamma = (aa - (1-alpha))/fun(qhat,t0)
PFA_calc = 1 - aa + gamma*fun(qhat,t0)

%% b
alpha = 0.05;
for k = 0:N
    aa = 0;
    for i = 0:k
        aa = aa + fun(i,t0);
    end
    if aa > (1-alpha)
        break
    end
end
qhat = k
aa
gamma = (aa - (1-alpha))/fun(qhat,t0)
PFA_calc = 1 - aa + gamma*fun(qhat,t0)
 
figure(1);clf;hold on
pp = 0.15:0.005:1.0;
for p = pp
    for k = 0:qhat
        bb = 0;
        for i = 0:k
            bb = bb + fun(i,p);
        end
    end
    PD_calc = 1 - bb + gamma*fun(qhat,p);
    plot(p,PD_calc,'rx')
end
xlabel('p')
ylabel('P_D')
title('Plot of P_D versus p \in [0.15,1.0]')
legend('P_D(p)')

%% PROBLEM 4
N = 10;
m0 = -ones(10,1);
m1 = -m0;
x0 = (m1+m0)/2;
r = zeros(N);
syms S2
V = (2/db2mag(3))^2;
for i = 1:N
    for j = 1:N
        r(i,j) = (0.9)^abs(i-j);
    end
end
R = r*V;
W = R\(m1-m0);
lambda = @(x) W.'*(x-x0);
S2 = W.'*R*W;

figure(2);clf;hold on
eta = -5:0.1:5;
pfa = 0.5*erfc((eta+S2/2)/sqrt(S2));
pd = 0.5*erfc((eta-S2/2)/sqrt(S2));
plot(pfa,pd,'-b')
xlabel('\alpha = P_{FA}')
ylabel('\beta = P_{D}')
title('ROC for SNR = 3dB')
plot(pfa,1-pfa,'-r')
plot(pfa(51),pd(51),'ko')
legend('ROC','\alpha = 1 - \beta','\eta = 0')