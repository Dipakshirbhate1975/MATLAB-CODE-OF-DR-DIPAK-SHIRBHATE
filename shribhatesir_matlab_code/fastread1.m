
clear all
clc

myw = vrworld('DeskLamp1.wrl');
open(myw)
f = vrfigure(myw);
set(f,'Name','lamp on hand')
x = nodes(myw, '-full')

c2=vrnode(myw,'color2');
lightv=vrnode(myw,'light');


%%
   s1 = serial(getAvailableComPort10(),'BaudRate',9600,'DataBits',8,'FlowControl','none','Terminator','CR', 'InputBufferSize', 100);
    
    fopen(s1);
    %%
    i = 0 ;
    clc
%     while i < 200
%     tic
%     tline = fgets(s1)
%     toc
%     end
    x1=[];
    y1=[];
    z1=[];
    flage1 = 0;
    format shortG
    while i < 200
    
    tline = fgets(s1)
    if length(tline) > 26
    i = i + 1;

        pt1 = strfind(tline,':1');
        pt2 = strfind(tline,':2');

        alls1=str2num(tline(pt1(1)+2:pt2(1)-1));
%         alls1=[alls1 ; str2num(qq)];

        pt1 = strfind(tline,':2');
        pt2 = strfind(tline,':3');
        alls2=str2num(tline(pt1(1)+2:pt2(1)-1));
%         alls2=[alls2 ; str2num(qq)];

        pt1 = strfind(tline,':3');
        pt2 = strfind(tline,':4');
        alls3=str2num(tline(pt1(1)+2:pt2(1)-1));
        
        pt1 = strfind(tline,':4');
        pt2 = strfind(tline,':5');
        ss1=str2num(tline(pt1(1)+2:pt2(1)-3));
        ss2=str2num(tline(pt1(1)+3:pt2(1)-2));
        ss3=str2num(tline(pt1(1)+4:pt2(1)-1));
        dd1 = ((alls1-10)*360/1000);
        dd2 = ((alls2-10)*360/1000);
        dd3 = ((alls3-10)*360/1000);
        
        if ss1==1
            if flage1==0
            c2.emissiveColor=[1 1 1];
            lightv.on=1;
            flage1 = 1 ;
           
            else
            c2.emissiveColor=[0 0 0];
            lightv.on=0;
            flage1 = 0 ;  
           
            end
        end
        
%         if ss2==1
%             c2.emissiveColor=[0 0 0];
%             lightv.on=0;
%         end

        
   ax = alls1;
   ay = alls2;
   az = alls3;
   xAngle = atan( ax / (sqrt(ay^2 + az^2)));
   yAngle = atan( ay / (sqrt(ax^2 + az^2)));
   zAngle = atan( sqrt(ax^2 + ay^2) / az);

   xAngle = xAngle * 180.00;  
   yAngle = yAngle * 180.00; 
   zAngle = zAngle * 180.00;
   
   xAngle =xAngle/ 3.141592;
   yAngle =yAngle/ 3.141592; 
   zAngle =zAngle/ 3.141592;
   x1=[x1;xAngle];
   y1=[y1;yAngle];
   z1=[z1;zAngle];
   [alls1 alls2 alls3 ss1 ss2 ss3; xAngle yAngle zAngle ss1 ss2 ss3] 
       
    end
    
    pause(0.1)
    end
    %%
    fclose(s1);
    fclose(instrfindall);
    delete(instrfindall);
    %%
subplot(311)
plot(x1)
subplot(312)
plot(y1)
subplot(313)
plot(z1)
figure
subplot(311)
plot(smooth(x1*1,0.05,'loess'))
subplot(312)
plot(smooth(y1*1,0.05,'loess'))
subplot(313)
plot(smooth(z1*1,0.05,'loess'))