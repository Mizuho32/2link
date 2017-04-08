function [f, dtd, de] = F_PDg(t, x, G)
global Kp Kd
global dtds dts

%   t1 = x(1);
%   t2 = x(2);
%   dt1 = x(3);
%   dt2 = x(4);

  xd  = Xd(t);
  
  td = xy2t(xd);
  
  dxd = dXd(t);

  %dtd = J(x(1), x(2))\dxd;
  dtd = J(td(1), td(2))\dxd;
  de  = dtd - x(3:4,1);
  dtds(:, length(dtds)+1) = dtd;
  kd  = Kd*( de );
  kp  = Kp*( td - x(1:2, 1));

  f = kp + kd + G;
end