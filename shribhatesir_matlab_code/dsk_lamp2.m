%%
clear all ; clc ;
%%
myw = vrworld('manish3.wrl');
open(myw)
f = vrfigure(myw);
set(f,'Name','lamp on hand')
x = nodes(myw, '-full')

%%

fa=vrnode(myw,'firstarm');
% fields(fa)
sa=vrnode(myw,'secondarm');
% fields(sa)
ls=vrnode(myw,'lampshade');
% fields(ls)

%%
w11=fa.rotation
%%
for i=0:0.1:6.28
     fa.rotation=[w11(1) w11(2) w11(3) w11(4)+i];
    pause(0.05)
    vrdrawnow
    i
end
%%
for i=0:0.5:6.28
     fa.rotation=[w11(1) w11(2)+1 w11(3) w11(4)+i];
    pause(0.1)
    i
end
%%
for i=0:0.5:6.28
     fa.rotation=[1 0 0 w11(4)+i];
    pause(0.1)
    i
end
%%
for i=0:0.5:6
    ls.rotation=[10 0 0 i];
    pause(0.1)
    i
end
%%