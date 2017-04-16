function [f, dtd, de] = F_DAC(t, x)
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
%    v2g= x(9:10,1);

  dxd = dXd(t);
  ddxd=ddXd(t); 
  
  td  = x(5:6,1);
  dtd = J(td(1), td(2))\dxd;
  
  de  = dtd - x(3:4,1);
  kd  = Kd*( de );
  kp  = Kp*( td - x(1:2, 1));
  
  ddtd = J(td(1), td(2))\(ddxd-dJ(td, dtd)*dtd);
% debug
%  tds(:, length(tds)+1) = td;  
%  dtds(:, length(dtds)+1) = dtd;
%  kds(:, length(kds)+1) = kd;
%  kps(:, length(kps)+1) = kp;

  %f = kp + kd;
  f = ddtd + kp + kd;
end