function [v] = ddXd(t)
global deltaR F f

  r1 = -(20*pi*f)^2 * deltaR * sin(20*pi*f*t);
  r2 =   20*pi*f    * deltaR * cos(20*pi*f*t);
  dxd = dXd(t);
  
  v = [  r1.*cos(F*t) - F * r2.*sin(F*t) - F*dxd(2)
         r1.*sin(F*t) + F * r2.*cos(F*t) + F*dxd(1) ];
end