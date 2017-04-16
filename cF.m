function [f1] = cF(x)
global l1 l2 m1 m2 g

  t1 = x(:, 1);
  t2 = x(:, 2);
 dt1 = x(:, 3);
 dt2 = x(:, 4);
 
  r1 = 1/2*l1;
  r2 = 1/2*l2;
  
  f1 = -( m1*r1*dt1.^2 + 1/2*m2*( 4*r1*dt1.^2 + 4*r2*cos(t2).*dt1.*(dt1+dt2) )  -m1*g*sin(t1) -m2*g*sin(t1+t2) );

end