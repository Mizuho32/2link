function [v] = ag2(th, dth, ddth)
global l1 l2

  l1g = l1;
  l2g = 1/2*l2;
  t1 = th(1);
  t2 = th(2);
 dt1 = dth(1);
 dt2 = dth(2);

  J = Jxg2(th);
 dJ = [ -l1g*cos(t1)*dt1 - l2g*sin(t1+t2)*(dt1+dt2),  -l2g*cos(t1+t2)*(dt1+dt2)
        -l1g*sin(t1)*dt1 - l2g*sin(t1+t2)*(dt1+dt2),  -l2g*sin(t1+t2)*(dt1+dt2) ];
  v = dJ*dth + J*ddth;
  
end