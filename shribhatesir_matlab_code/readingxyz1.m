

s1 = serial(getAvailableComPort(),'BaudRate',9600,'DataBits',8,'FlowControl','none');
% s1.BytesAvailableFcnCount = 1;
% s1.BytesAvailableFcnMode = 'byte';
% 
% s1.BytesAvailableFcn = @instrcallback;
% s1.Terminator ='byte';
fopen(s1);
%%
tline = fgets(s1)
%%
fclose(s1);


