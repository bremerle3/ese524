% Find a primitive polynomial in GF(5)
% Copyright 1999 by Todd K. Moon

testlist = [1 0 0;
	        1 0 1;
            1 0 2;
            1 0 3;
            1 0 4;
            1 1 0;
       	    1 1 1;
            1 1 2;
            1 1 3;
            1 1 4;
            1 2 0;
            1 2 1;
            1 2 2;
            1 2 3;
            1 2 4;
            1 3 0;
            1 3 1;
			1 3 2;
			1 3 3;
			1 3 4;
			1 4 0;
			1 4 1;
			1 4 2;
			1 4 3;
			1 4 4;
			2 0 1;
			2 0 2;
			2 0 3;
			2 0 4;
			2 1 0;
			2 1 1;
			2 1 2;
			2 1 3;
			2 1 4;
			2 2 0;
			2 2 1;
			2 2 2;
			2 2 3;
			2 2 4;
			2 2 5;
			2 3 0;
			2 3 1;
			2 3 2;
			2 3 3;
			2 3 4;
			2 4 0;
			2 4 1;
			2 4 2;
			2 4 3;
			2 4 4;
			2 0 2;
			3 0 3;
			3 0 4;
			3 1 0;
			3 1 1;
			3 1 2;
			3 1 3;
			3 1 4;
			3 2 0;
			3 2 1;
			3 2 2;
			3 2 3;
			3 2 4;
			3 2 5;
			3 3 0;
			3 3 1;
			3 3 2;
			3 3 3;
			3 3 4;
			3 4 0;
			3 4 1;
			3 4 2;
			3 4 3;
			3 4 4];
			
[n1,n2] = size(testlist)
for n = 1:n1    % for each poly  in testlist
  v = mod(polyval(testlist(n,:),(0:4)),5);
  if(all(v ~= 0))  % no roots: irreducible
	found = 1;
	for i=3:23
	  [q,r] = polydivgfp([1 zeros(1,i-1) -1],testlist(n,:),5);
	  if(all(r == 0))   % found a divisor
		found = 0;
		break;
	  end
	end
	if(found)
	  disp('Primitive polynomial');
	  testlist(n,:)
	end
  end
end
	