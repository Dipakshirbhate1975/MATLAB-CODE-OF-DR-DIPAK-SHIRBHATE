% double xyz[3];
%    double ax, ay, az;
% 
%    adxl.get_Gxyz(xyz);
%    ax = xyz[0];
%    ay = xyz[1];
%    az = xyz[2];
%    double xAngle = atan( ax / (sqrt(square(ay) + square(az))));
%    double yAngle = atan( ay / (sqrt(square(ax) + square(az))));
%    double zAngle = atan( sqrt(square(ax) + square(ay)) / az);
% 
%    xAngle *= 180.00;   yAngle *= 180.00;   zAngle *= 180.00;
%    xAngle /= 3.141592; yAngle /= 3.141592; zAngle /= 3.141592;

   ax = 550;
   ay = 20;
   az = 750;
   xAngle = atan( ax / (sqrt(ay^2 + az^2)));
   yAngle = atan( ay / (sqrt(ax^2 + az^2)));
   zAngle = atan( sqrt(ax^2 + ay^2) / az);

   xAngle = xAngle * 180.00;  
   yAngle = yAngle * 180.00; 
   zAngle = zAngle * 180.00;
   
   xAngle =xAngle/ 3.141592;
   yAngle =yAngle/ 3.141592; 
   zAngle =zAngle/ 3.141592;