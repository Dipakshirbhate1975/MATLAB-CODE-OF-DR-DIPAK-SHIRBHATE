function acc_read1()

global exitflag;
global s1;

alls1=[];
alls2=[];
alls3=[];
fter = 0;
   
hFig = figure('Toolbar','none','Menubar', 'none',...
    'Name','acc_read','Resize','off','CloseRequestFcn',{@my_closereq},...
    'Position',[200 100 350 150],'Color',[0.6 0.6 0.6]);
axis off; 

val = uicontrol(gcf,'Style','text','FontSize',10,'String','value',...
        'Units','normalized','Position',[0.15 0.85 0.2 .12]);
vmin = uicontrol(gcf,'Style','text','FontSize',10,'String','min',...
        'Units','normalized','Position',[0.38 0.85 0.15 .12]);
vmax = uicontrol(gcf,'Style','text','FontSize',10,'String','max',...
        'Units','normalized','Position',[0.57 0.85 0.2 .12]);
vdeg = uicontrol(gcf,'Style','text','FontSize',10,'String','deg',...
        'Units','normalized','Position',[0.8 0.85 0.2 .12]);
    
xh = uicontrol(gcf,'Style','text','FontSize',10,'String','x',...
        'Units','normalized','Position',[0.01 0.75 0.12 .12]);  
    
xb = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.15 0.75 0.2 .12],'BackgroundColor','w');  

xmin = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.38 0.75 0.15 .12],'BackgroundColor','w');  
    
xmax = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.57 0.75 0.2 .12],'BackgroundColor','w');  
    
xdeg = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.8 0.75 0.2 .12],'BackgroundColor','w');  
    
yh = uicontrol(gcf,'Style','text','FontSize',10,'String','y',...
        'Units','normalized','Position',[0.01 0.5 0.12 .12]);  
    
yb = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.15 0.5 0.2 .12],'BackgroundColor','w');  

ymin = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.38 0.5 0.15 .12],'BackgroundColor','w');  
    
ymax = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.57 0.5 0.2 .12],'BackgroundColor','w');  
    
ydeg = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.8 0.5 0.2 .12],'BackgroundColor','w');  

zh = uicontrol(gcf,'Style','text','FontSize',10,'String','z',...
        'Units','normalized','Position',[0.01 0.2 0.12 .12]);  
    
zb = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.15 0.2 0.2 .12],'BackgroundColor','w');  

zmin = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.38 0.2 0.15 .12],'BackgroundColor','w');  
    
zmax = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.57 0.2 0.2 .12],'BackgroundColor','w');  
    
zdeg = uicontrol(gcf,'Style','edit','FontSize',12,'String','8',...
        'Units','normalized','Position',[0.8 0.2 0.2 .12],'BackgroundColor','w');  

avl_comm = uicontrol('String','comm list','Callback', {@avl_comm_callback},'FontSize',14,...
                'Units','normalized','Position',[0.05 0.03 .3 .12]);

connect = uicontrol('String','conn...','Callback', {@connect_callback},'FontSize',14,...
                'Units','normalized','Position',[0.38 0.03 .3 .12]);
disconnect = uicontrol('String','disconn..','Callback', {@disconnect_callback},'FontSize',14,...
                'Units','normalized','Position',[0.7 0.03 .3 .12]);


%%  avl_comm_callback
    function avl_comm_callback(hObject,eventdata)
    getAvailableComPort10()
    end 
%%  connect_callback
    function connect_callback(hObject,eventdata)
        
    if (length(cell2mat(getAvailableComPort10()))> 2)
    exitflag=0;    
    s1 = serial(getAvailableComPort10(),'BaudRate',9600,'DataBits',8,'FlowControl','none');
     
    set(s1,'InputBufferSize',5000);
    set(s1,'BytesAvailableFcnCount',50);
    set(s1,'BytesAvailableFcnMode','byte');
    set(s1,'BytesAvailableFcn',@instrcallback);
    fopen(s1);
    else
    disp('no device found')    
    exitflag=0;
    end
      

    end     

%%  disconnect_callback
    function disconnect_callback(hObject,eventdata)

    exitflag=1;
    fclose(instrfindall);
   
    end     

%%
function instrcallback(hObject,eventdata)
  fter = fter + 1 
  s1.BytesAvailable
  
    
%   fread(s1, s1.BytesAvailable)
   tline = fgetl(s1)
% tline = fread(s1)
    flushinput(s1)
    fclose(s1);
    pt1 = strfind(tline,':1');
    tline=tline(pt1(5):pt1(6))
    pt1 = strfind(tline,':1');
    pt2 = strfind(tline,':2');
    
    qq=tline(pt1(1)+2:pt2(1)-1)
    alls1=[alls1 ; str2num(qq)];
    
    pt1 = strfind(tline,':2');
    pt2 = strfind(tline,':3');
    qq=tline(pt1(1)+2:pt2(1)-1)
    alls2=[alls2 ; str2num(qq)];

    pt1 = strfind(tline,':3');
    pt2 = strfind(tline,':4');
    qq=tline(pt1(1)+2:pt2(1)-1)
    
    alls3=[alls3 ; str2num(qq)];
    
    set(xb,'string',alls1(end));
    set(yb,'string',alls2(end));
    set(zb,'string',alls3(end));
    
    set(xmin,'string',min(alls1));
    set(ymin,'string',min(alls2));
    set(zmin,'string',min(alls3));
    
    set(xmax,'string',max(alls1));
    set(ymax,'string',max(alls2));
    set(zmax,'string',max(alls3));
    drawnow;
  
  fclose(instrfindall);
  delete(instrfindall);
  s1 = serial(getAvailableComPort10(),'BaudRate',9600,'DataBits',8,'FlowControl','none');
  set(s1,'InputBufferSize',5000);
  set(s1,'BytesAvailableFcnCount',50);
  set(s1,'BytesAvailableFcnMode','byte');
  set(s1,'BytesAvailableFcn',@instrcallback);
  
  fopen(s1);  
  
end


    %%  my_closereq
    function my_closereq(hObject,eventdata)
       
        fclose(instrfindall);
        delete(gcf);
        clear all;
        
    end 
end