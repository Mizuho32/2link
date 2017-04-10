function [dj] = dJ(q, dq)
global l1 l2

  t1 = q(1);
  t2 = q(2);
  dt1= dq(1);
  dt2= dq(2);
  
  dj = [ -l1*cos(t1)*dt1 - l2*sin(t1+t2)*(dt1+dt2),  -l2*cos(t1+t2)*(dt1+dt2)
         -l1*sin(t1)*dt1 - l2*sin(t1+t2)*(dt1+dt2),  -l2*sin(t1+t2)*(dt1+dt2) ];
end