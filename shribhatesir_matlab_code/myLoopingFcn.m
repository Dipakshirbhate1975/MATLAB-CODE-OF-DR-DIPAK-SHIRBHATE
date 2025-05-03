function myLoopingFcn() 
global KEY_IS_PRESSED
KEY_IS_PRESSED = 0;
gcf
set(gcf, 'KeyPressFcn', @myKeyPressFcn)
set(gcf,'Position',[10 10 50 20])
set(gcf,'Toolbar','none','Menubar', 'none');

while ~KEY_IS_PRESSED
      drawnow
      disp('looping...')
end
disp('loop ended')
delete(gcf);

function myKeyPressFcn(hObject, event)
global KEY_IS_PRESSED
KEY_IS_PRESSED  = 1;
disp('key is pressed') 