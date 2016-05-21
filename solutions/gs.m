function q = gs(P,a,b,w,t)
% 
% Gram-Schmidt using symbolic toolbox
%
% function q = gs(P,a,b,w,t)
%
% P = list of functions in P(1), P(2), ...
% a = lower limit of integration
% b = upper limit of integration
% w = weight function
% t = variable of integration
%
% q = array of orthogonal functions

% Copyright 1999 by Todd K. Moon

Nfunc = length(P);
syms q ek n1;
q = [];
for k=1:Nfunc
   n1 = int(P(k)^2 * w,t,a,b);
   if(n1 ~= 0)
      break;
   end
end
if(n1==0)
   return
end
q = P(k)/sqrt(n1);
q
j = 1;
for k=k:Nfunc
   ek = 0;
   for i=1:j
      ek = ek + int(P(k)*q(i)*w,t,a,b)*q(i);
   end
   ek = P(k) - ek;
   n1 = int(ek^2*w,t,a,b);
   if(n1 ~= 0)
      j = j+1;
      q = [q ek/sqrt(n1)];
   end
end

