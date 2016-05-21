% Test the findperm program
% Copyright 1999 by Todd K. Moon

n=7;        % length of vectors to test
ntest = 500;  % number of random elements to test
Plist = makeperm(n);   % make a list of all permutations

numbad = 0;
numbad2 = 0;
numbad3 = 0;
%$$$ savebada = [];
%$$$ savebadb = [];
%$$$ savebadP1 = [];
%$$$ savebadP2 = [];
%$$$ 
%$$$ savebada2 = [];
%$$$ savebadb2 = [];
%$$$ savebadP12 = [];
%$$$ savebadP22 = [];
%$$$ 
%$$$ savebada3 = [];
%$$$ savebadb3 = [];
%$$$ savebadP13 = [];
%$$$ savebadP23 = [];

a = floor(20*rand(1,n));
for i=1:ntest
  b = floor(20*rand(1,n));
  P = findperm2(a,b);
  P2 = greedyperm(a,b);
  P3 = greedyperm2(a,b);
  
  as = a(P);
  as2 = a(P2);
  as3 = a(P3);
  d0 = (b-as)*(b-as)';
  d02 = (b-as2)*(b-as2)';
  d03 = (b-as3)*(b-as3)';
  Pbest = P;
  Pbest2 = P2;
  Pbest3 = P3;
  % see if this is the best possible
  f1 = 0;  f2 = 0;  f3=0;
  for j=1:fact(n)
	x = b-a(Plist(j,:));
	d = x*x';
	if(d < d0)
	  d0 = d;
	  Pbest = Plist(j,:);
	  f1 = 1;
	end
	if(d < d02)
	  d02 = d;
	  Pbest2 = P;
	  f2 = 1;
	end
	if(d < d03)
	  d03 = d;
	  Pbest3 = P;
	  f3 = 1;
	end
  end
  if(f1)
%	disp('better perm found')
%$$$ 	savebada = [savebada; a];
%$$$ 	savebadb = [savebadb; b];
%$$$ 	savebadP1 = [savebadP1; P];
%$$$ 	savebadP2 = [savebadP2; Pbest];
	numbad = numbad+1;
  end
  if(f2)
%	disp('better than greedy found')
%$$$ 	savebada2 = [savebada2; a];
%$$$ 	savebadb2 = [savebadb2; b];
%$$$ 	savebadP12 = [savebadP12; P];
%$$$ 	savebadP22 = [savebadP22; Pbest];
	numbad2 = numbad2+1;
  end
  if(f3)
%	disp('better than greedy 2 found')
%$$$ 	savebada3 = [savebada3; a];
%$$$ 	savebadb3 = [savebadb3; b];
%$$$ 	savebadP13 = [savebadP13; P];
%$$$ 	savebadP23 = [savebadP23; Pbest];
	numbad3 = numbad3+1;
  end
end
numbad
numbad2
numbad3
