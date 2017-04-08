function [f] = F_PD(t, x)
global Kp Kd

  %xd = 1;
  %yd = 1;
  
  xd = [1; 1];
  %xd  = Xd(t);
  
  td = xy2t(xd);
  
%   t1 = x(1);
%   t2 = x(2);
%   dt1 = x(3);
%   dt2 = x(4);
  %dxd = dXd(t);
  %Jinv = inv(J(x(1), x(2)));
  
  %dtd   = J(x(1), x(2))\dxd;
  dtd = [0; 0];
  %kd1 = Kd*( dtd1 - dt1 );
  %kd2 = Kd*( dtd2 - dt2 );
  
  kd   = Kd.*( dtd - x(3:4,1));
    
  %tau1 = Kp*(td1-t1) + kd1;
  %tau2 = Kp*(td2-t2) + kd2;
  
  f = Kp.*( td - x(1:2, 1))+ kd;
  
  %f = [tau1; tau2];
end