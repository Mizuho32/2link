function [e] = E(x)
global l1 l2 m1 m2 I1 I2 g
t1 = x(1);
t2 = x(2);
dt1= x(3);
dt2= x(4);

U = m1*g*l1/2*sin(t1) + m2*g*(l1*sin(t1)+l2/2*sin(t1+t2));
K = 1/2*(...
  1/4*m1*l1^2*dt1^2 + ...
  m2*(l1^2*dt1^2+1/4*l2^2*(dt1+dt2)^2 + l1*l2*dt1*(dt1+dt2)*cos(t2)) ...
  + 1/2*(I1*dt1^2 + I2*(dt1+dt2)^2) ...
  );
e = K + U;

end