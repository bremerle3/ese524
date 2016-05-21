% testkarmarker.m: Test the Karmarker linear programming solution
% Copyright 1999 by Todd K. Moon

c0 = [3 -2 4 0 0 0]';
A0 = [7 5 -1 1 0 0
	 2 2 3 0 1 0
	 -5 -6 8 0 0 1];
b0 = [9;5;-10];
[x,value,w] = simplex1(A0,b0,c0)
[A,c] = tokarmarker(A0,b0,c0);
xk = karmarker(A,c)
