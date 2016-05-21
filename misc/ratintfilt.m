% Try some data for a rationally-interpolated filter
% Copyright 1999 by Todd K. Moon

clear i;
om = [-.2 0 .2];
z = exp(i * om);
H = [.9*exp(-i*.1) 1 .9*exp(i*.1)];
phis = invdiff(z,H);
[N,D] = ratinterp(z,H);
% check it
ratinterp1(z,z,H,phis)
 
a1 = fliplr(real(vandsolve1(z,H)))
H 
polyval(a1,z)

%$$$ om = linspace(-pi,pi,17);
%$$$ z = exp(i*om); 
%$$$ H = zeros(size(om));
%$$$ for k=1:length(om)
%$$$   if(abs(om(k)) < pi/4)
%$$$    H(k) = 1*exp(i* (-.2) *om(k));
%$$$   else
%$$$    H(k) = exp(-10*(abs(om(k))-pi/4))*exp(i* (-.2) *om(k));
%$$$   end
%$$$ end
% 
om = [-pi, -.25*pi -.2*pi -.1*pi, 0, .1*pi, .2*pi .25*pi pi];
z = exp(i*om);
H = exp(-2 *(abs(om)-.1*pi)) .* exp(i*(-.2) .* om);
H(4) = .99*exp(i*(-.2) .* om(4));
H(5) = 1.3;
H(6) = .99*exp(i*(-.2) .* om(6));

phis = invdiff(z,H);
[N,D] = ratinterp(z,H);
Nroots = roots(N);
Droots = roots(D);

figure(1); 
subplot(2,2,1);
pzcancel = 0;
if(pzcancel) 
  numnorm = N(1);
  dennorm = D(1);
  Nl = length(Nroots);
  Dl = length(Droots);
  j=1; k=1;
  while(j <= Dl)
    if(j > length(Droots))
      break
    end
    while(k <= Nl)
      if(j > length(Droots))
        break
      end
      if(abs(Nroots(k) - Droots(j)) < 1.e-5)
        if(abs(abs(Nroots(k))- 1) > 1.e-5)
          Nroots = [Nroots(1:k-1) Nroots(k+1:end)];
          Nl = Nl-1;
        end
        Droots = [Droots(1:j-1) Droots(j+1:end)];
        Dl = Dl-1;
      end
      j = j+1; k = k+1;
    end
  end
  N = poly(Nroots)*numnorm;
  D = poly(Droots)*dennorm;
  % check it
  checkH = polyval(N,z) ./ polyval(D,z);
  plot(om,abs(H),'o',om,abs(checkH),'rx');
else
  % check it
  interpH = ratinterp1(z,z,H,phis);
%  plot(om,abs(H),'o',om,abs(interpH),'rx');
  plot(om,abs(H),'o');
  xlabel('\Omega');
  ylabel('|H(\ite^{\itj \Omega})|')
end
hold on


omplot = linspace(-pi,pi,101);
zplot = exp(i*omplot);
%Hplot = ratinterp1(zplot,z,H,phis);
Hplot = polyval(N,zplot) ./ polyval(D,zplot);
% now reflect the poles that are too big back in
normfact = D(1);
for i=1:length(Droots)
  if(abs(Droots(i)) > 1)
    fprintf(1,'abs(D) = %f\n',abs(Droots(i)));
    normfact = normfact*abs(Droots(i)); 
    Droots(i) = 1/conj(Droots(i));
  end
end
Dnew = poly(Droots)*normfact;
Hplot2 = polyval(N,zplot) ./ polyval(Dnew,zplot);

hold on
plot(omplot,abs(Hplot));
subplot(2,2,2);
plot(om,angle(H),'o',omplot,angle(Hplot));
xlabel('\Omega');
ylabel('\angle H(\ite^{\itj \Omega})')

subplot(2,2,3);
zplane(N,D);

subplot(2,2,4);
plot(omplot,angle(Hplot2));
xlabel('\Omega');
ylabel('\angle H(\ite^{\itj \Omega})')
print -dps ../pictures/ratintfilt.ps

% Now try a linear interpolant
V = (gallery('vander',z))';
b = H';
a = fliplr(real(vandsolve1(z,H)))
figure(2);
Hplotcheckfir = polyval(a,z);
Hplotfir = polyval(a,zplot);
subplot(2,2,1);
plot(om,20*log(abs(H)),'o',om,20*log(abs(Hplotcheckfir)),'rx',omplot,20*log(abs(Hplotfir)));
% axis([-4 4 0 1.5]);
xlabel('\Omega');
ylabel('\angle H(\ite^{\itj \Omega}) (dB)')
subplot(2,2,2);
plot(om,angle(H),'o',om,angle(Hplotcheckfir),'rx',omplot,angle(Hplotfir));
xlabel('\Omega');
ylabel('\angle H(\ite^{\itj \Omega})')
subplot(2,2,3);
zplane(a,1);
subplot(2,2,4);
plot(0:length(a)-1,a)
xlabel('\itn')
ylabel('\ita(\itn)')