function c = wino3by3(a,b) 
% 
% Convolve the 3-sequence a with the 3-sequence b 
% a and b are both assumed to be column vectors
% using Winograd convolution
%
% function c = wino3by3(a,b) 

% Copyright 1999 by Todd K. Moon

Amat = [1 0 0;
     1/4  1/4 1/4;
     1/4 -1/4 1/4;
     1/2 0 -1/2;
     -1/2 1/2 1/2
     1/2 1/2 -1/2];
A = Amat*a;   % don't count this computation: "precomputed"
 
                                         % Adds         Mults
t0 = b(1)+b(3);   t1 = b(1)-b(3);        %  2
B(1,1) = b(1);  B(2,1) = t0+b(2);        %  1
B(3,1) = t0 - b(2); B(4,1) = t1+b(2);    %  2
B(5,1) = t1;  B(6,1) = b(2);

C = A .* B;                              %                6
% Post additions
s0 = C(2)-C(3);  s1 = C(4)+C(5);         %  2
s2 = C(2)+C(3);  s3 = C(4)-C(6);         %  2

c(1) = C(1);  c(2) = s0+s1;              %  1
c(3) = s2-s3;  c(4) = s0-s1;             %  2
c(5) = s2+s3-C(1);                       %  2
 
                      % Totals:          % 14             6
c=c';