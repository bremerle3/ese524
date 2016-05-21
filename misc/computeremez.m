% Test the remez algorithm
% Copyright 1999 by Todd K. Moon

f = 'exp';
m = 2;
a = -1;
b = 1;



%function ap = computeremez(f,m,a,b)
% function ap = computeremez(f,m,k,a,b)
%
% The Remez algorithm for polynomial approximation
%
% f = input function (a function function)
%     (must be able to evaluate f with a vector of inputs)
% m = order of numerator
% a,b = range of interpolant
%
% ap = coefficients of interpolating polynomial
%
N = m;
delta = (b-a)/(N+3);
dfine = 0.01;
tfine = (a:dfine:b)';                   % "fine grid" spacing
ndfine = length(tfine);
ev = 0:m;                               % exponent values
t = (a+delta:delta:b-delta)';           % get the initial guess
ffine = eval([f '(tfine)']);            % function on fine grid
epsilon = 1.e-4;                        % to test convergence

M = zeros(N+2,N+2);
tval = 0.5; tidx = 150;
lastmaxp = 0; lastminp = 0;
for loop=1:10
  fv = eval([f '(t)']);
  for i=1:N+2
    M(i,:) = [t(i).^ev -(-1)^i];
  end
  av = M\fv;
  ap = av(m+1:-1:1);
  hvals = ffine - polyval(ap,tfine);
  plot(tfine,hvals); hold on
  xlabel('\itt');
  ylabel('\itf(\itx) - \itR(\itx)');
  plot(t,fv - polyval(ap,t),'o');
   if(loop < 4)
     text(tfine(tidx),hvals(tidx),int2str(loop));
     tidx = tidx+10;
   end

  % find N+2 peaks
  peakh(1) = hvals(1);
  signh(1) = sign(hvals(1));
  t(1) = tfine(1);
  npfound = 1; 
  maxp = 0; minp = 0;
  for i=2:ndfine-1
    if(sign((hvals(i)-hvals(i-1))*(hvals(i+1)-hvals(i))) < 0) % peak found
      if(sign(hvals(i)) ~= signh(npfound)) % different signs
        npfound = npfound+1;
        peakh(npfound) = hvals(i);
        if(peakh(npfound) > maxp)
          maxp = peakh(npfound)
        end
        if(peakh(npfound) < minp)
          minp = peakh(npfound)
        end
        signh(npfound) = sign(hvals(i));
        t(npfound) = tfine(i);
        if(npfound == N+2)
          break;
        end
      end
    end
  end
  % add the value at the end
  if(npfound < N+2)
    npfound = npfound+1;
    peakh(npfound) = hvals(ndfine);
    signh(npfound) = sign(hvals(ndfine));
    t(npfound) = tfine(ndfine);
  end
  
  if(npfound ~= N+2)                    % still not enough points
    error('Insufficient number of peaks found');
  end
%  plot(t,peakh,'o');
  if(abs(maxp - abs(minp)) < epsilon)
    break;
  end
end