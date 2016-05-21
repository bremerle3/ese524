(* example of a taylor series *)
(* Copyright 1999 by Todd K. Moon *)

f = x + Sin[x y]

Dc[f_] := dx D[f,x] + dy D[f,y];
Dc2[f_] := dx^2 D[D[f,x],x] + 2 dx dy D[D[f,x],y] + dy^2 D[D[f,y],y];

tayl1 = f /. {x->x0,y->y0};
tayl2 = Dc[f] /. {x->x0,y->y0};
tayl3 = Dc2[f] /.{x->x0,y->y0};
taylf = Simplify[tayl1 + tayl2 + tayl3/2];

dxdyc = Coefficient[taylf,dx dy];
taylf2 = Simplify[taylf - dxdyc dx dy];
dx2c = Coefficient[taylf2,dx,2];
taylf2 = Simplify[taylf2 - dx2c dx^2];
dy2c = Coefficient[taylf2,dy,2];
taylf2 = Simplify[taylf2 - dy2c dy^2];
dxc = Coefficient[taylf2,dx];
taylf2 = Simplify[taylf2 - dxc dx];
dyc = Coefficient[taylf2,dy];
taylf2 = Simplify[taylf2 - dyc dy];

newtayl = taylf2 + dx dxc + dy dyc + dx dy dxdyc + dx2c dx^2 + dy2c dy^2;



