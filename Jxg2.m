function [j] = Jxg2(q)
global l1 l2

  l1g = l1;
  l2g = 1/2*l2;
  t1 = q(1);
  t2 = q(2);
  
  j = [ -l1g*sin(t1)-l2g*sin(t1+t2), -l2g*sin(t1+t2)
         l1g*cos(t1)+l2g*cos(t1+t2), +l2g*cos(t1+t2) ];
end