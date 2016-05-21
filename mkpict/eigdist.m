% show the asymptotic equal distribution of eigenvalues
% Copyright 1999 by Todd K. Moon

m = 8;
k = 0:m
r = exp(-.2 .* k);
r = [r(end:-1:2) r];
n = 30;
% build the toeplitz matrix
R = [];
zf = [];
for i=0:n-1
  if(i < m+1)
    t = r(m-i+1:end);  lt = length(t);
    R = [R; [t zeros(1,n-lt)]];
  elseif(i < n-m)
    zf = [zf 0];
    t = [zf r];  lt = length(t);
    R = [R; [t zeros(1,n-lt)]];
  else
    t = [0 t(1:end-1)];
    R = [R; t];
  end
end
eR = eig(R);
eR = eR(end:-1:1);
k=0:n-1;
omegal = 2*pi*k/n;
k = -m:m;
fomega = [];
i = sqrt(-1);
for omega = omegal
  fo = r(k+m+1)*exp(i*k*omega)';
  fomega = [fomega real(fo)];
end
fomegaf = [];
omegaf = 2*pi*(0:1000)/1000;
i = sqrt(-1);
for omega = omegaf
  fo = r(k+m+1)*exp(i*k*omega)';
  fomegaf = [fomegaf real(fo)];
end

clf
subplot(2,1,1)
plot(omegaf/(2*pi), fomegaf);

% sort according to best match

P = findperm(eR,fomega);
eRnew = eR(P);
%$$$ 
%$$$ eRsave = eR;
%$$$ srl = [];
%$$$ srr = [];
%$$$ for i=1:n/2
%$$$   [x,idx] = min(abs(fomega(i)-eR));
%$$$ %$$$   if(x > .1)
%$$$ %$$$   disp('bad match');
%$$$ %$$$   x
%$$$ %$$$   eR(idx) = fomega(i);
%$$$ %$$$   end
%$$$   srl = [srl eR(idx)];
%$$$   eR = [eR(1:idx-1); eR(idx+1:end)];
%$$$   [x,idx] = min(abs(fomega(n-i+1)-eR));
%$$$ %$$$   if(x > .1)
%$$$ %$$$   disp('bad match');
%$$$ %$$$   x
%$$$ %$$$   eR(idx) = fomega(n-i+1);
%$$$ %$$$   end
%$$$   srr = [eR(idx) srr];
%$$$   eR = [eR(1:idx-1); eR(idx+1:end)];
%$$$ end
%$$$ eRnew = [srl srr];

hold on 
stem(omegal/(2*pi),eRnew);
axis([0 1 0 10])
xlabel('\omega/2\pi')
ylabel('S(\omega) and eigenvalues')
text(.8,7,'n=30')
print -dps ../pictures/eigspect.ps
print -deps ../pictures/eigspect.eps

n = 100;
% build the toeplitz matrix
R = [];
zf = [];
for i=0:n-1
  if(i < m+1)
    t = r(m-i+1:end);  lt = length(t);
    R = [R; [t zeros(1,n-lt)]];
  elseif(i < n-m)
    zf = [zf 0];
    t = [zf r];  lt = length(t);
    R = [R; [t zeros(1,n-lt)]];
  else
    t = [0 t(1:end-1)];
    R = [R; t];
  end
end
eR = eig(R);
eR = eR(end:-1:1);
k=0:n-1;
omegal = 2*pi*k/n;
k = -m:m;
fomega = [];
i = sqrt(-1);
for omega = omegal
  fo = r(k+m+1)*exp(i*k*omega)';
  fomega = [fomega real(fo)];
end

% sort according to best match
P = findperm(eR,fomega);
eRnew = eR(P);

%$$$ eRsave = eR;
%$$$ srl = [];
%$$$ srr = [];
%$$$ for i=1:n/2
%$$$   [x,idx] = min(abs(fomega(i)-eR));
%$$$ %$$$   if(x > .1)
%$$$ %$$$   disp('bad match');
%$$$ %$$$   x
%$$$ %$$$   eR(idx) = fomega(i);
%$$$ %$$$   end
%$$$   srl = [srl eR(idx)];
%$$$   eR = [eR(1:idx-1); eR(idx+1:end)];
%$$$   [x,idx] = min(abs(fomega(n-i+1)-eR));
%$$$ %$$$   if(x > .1)
%$$$ %$$$   disp('bad match');
%$$$ %$$$   x
%$$$ %$$$   eR(idx) = fomega(n-i+1);
%$$$ %$$$   end
%$$$   srr = [eR(idx) srr];
%$$$   eR = [eR(1:idx-1); eR(idx+1:end)];
%$$$ end
%$$$ eRnew = [srl srr];
%$$$ %clf
subplot(2,1,2)
plot(omegaf/(2*pi), fomegaf);
hold on 
stem(omegal/(2*pi),eRnew);
axis([0 1 0 10])
xlabel('\omega/2\pi')
ylabel('S(\omega) and eigenvalues')
text(.8,7,'n=100')
print -dps ../pictures/eigspect.ps
print -deps ../pictures/eigspect.eps