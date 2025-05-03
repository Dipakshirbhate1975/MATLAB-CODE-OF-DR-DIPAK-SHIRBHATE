myw = vrworld('DeskLamp2.wrl');
open(myw)
f = vrfigure(myw);
set(f,'Name','lamp on hand')
x = nodes(myw, '-full')

%%
t2=vrnode(myw,'button1');
r4=t2.children;
qq2=r4(1,2);
qq2(1,1).enabled=1
%%
vrdrawnow
%%
t2=vrnode(myw,'button2');
r4=t2.children;
qq2=r4(1,2);
qq2(1,1).enabled=1


%%
ccode1=vrnode(myw,'code1')
fields(ccode1)
ccode2=vrnode(myw,'code2')
fields(ccode2)
%%
l2=vrnode(myw,'lamp')
fields(l2)
%%
cp1=vrnode(myw,'colorpath1')
fields(cp1)
%%
cp2=vrnode(myw,'colorpath2')
fields(cp2)
%%
c2=vrnode(myw,'color2')
fields(c2)
%%

lightv=vrnode(myw,'light')
fields(lightv)
%%
mfa=vrnode(myw,'movefirstarm')
fields(mfa)
%%
fa=vrnode(myw,'firstarm')
fields(fa)
%%
msa=vrnode(myw,'movesecondarm')
fields(msa)
%%
sa=vrnode(myw,'secondarm')
fields(sa)
%%
mls=vrnode(myw,'movelampshade')
fields(mls)
%%
ls=vrnode(myw,'lampshade')
fields(ls)

%%
set(f,'Lighting','off')
set(f,'Lighting','on')
set(f,'Headlight','off')
set(f,'Headlight','on')
set(f,'Headlight','off')
set(f,'Headlight','on')
