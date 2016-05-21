% demonstrate the VA

ttrellis{1} = [1 2]; ttrellis{2} = [3 4]; 
ttrellis{3} = [1 2]; ttrellis{4} = [3 4];
tbranchweight{1,1} = 0; tbranchweight{1,2} = 6;
tbranchweight{2,1} = 3; tbranchweight{2,2} = 3;
tbranchweight{3,1} = 6; tbranchweight{3,2} = 0;
tbranchweight{4,1} = 3; tbranchweight{4,2} = 3;

initvit1(ttrellis,tbranchweight,7,'vitsqnorm');

rlist = [6, 3, 6, 6, 3, 3, 0, 5, 1, 3];
plist = [];
% Go through the inputs one at a time
for r = rlist
  p = viterbi1(r);
  if(p)
	plist = [plist p];
  end
end
% Now flush the rest out
plist = [plist vitflush(0)];
