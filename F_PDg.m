function [f, dtd, de] = F_PDg(t, x, G)
global Kp Kd
global dtds kds kps tds

%   t1 = x(1);
%   t2 = x(2);
%   dt1 = x(3);
%   dt2 = x(4);
%   td1 = x(5);
%   td2 = x(6);
%    e1 = x(7);
%    e2 = x(8);

  xd  = Xd(t);
  
  td = xy2t(xd);
  tds(:, length(tds)+1) = td;
  
  dxd = dXd(t);

  %dtd = J(x(1), x(2))\dxd;
  dtd = J(td(1), td(2))\dxd;
  de  = dtd - x(3:4,1);
  dtds(:, length(dtds)+1) = dtd;
  kd  = Kd*( de );
  kp  = Kp*( x(5:6,1) - x(1:2, 1));
  kds(:, length(kds)+1) = kd;
  kps(:, length(kps)+1) = kp;

  f = kp + kd + G;
end