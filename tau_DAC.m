function [tau] = tau_DAC(t, x)
global l1 l2 m1 m2 I1 I2 g

t1  = x(1);
t2  = x(2);
dt1 = x(3);
dt2 = x(4);

a1 = 1/4*m1*l1^2 + m2*l1^2 + 1/4*m2*l2^2 + l1*l2*m2*cos(t2) + I1 + I2;
b1 = 1/4*m2*l2^2 +                     1/2*l1*l2*m2*cos(t2) +      I2;
a2 = 1/4*m2*l2^2 +                     1/2*l1*l2*m2*cos(t2) +      I2;
b2 = 1/4*m2*l2^2 +                                                 I2;

c1 = 1/2*l1*m1*g*cos(t1) + m2*g*(l1*cos(t1)+1/2*l2*cos(t1+t2));
c2 = 1/2*l2*m2*g*cos(t1+t2);

D = ...
  [ a1 b1
    a2 b2 ];
C = ...
  [ -l1*l2*m2*sin(t2)*dt2    -1/2*l1*l2*m2*sin(t2)*dt2
    1/2*l1*l2*m2*sin(t2)*dt1                         0 ];
G = [ c1
      c2 ];
[v, ~, ~] = F_DAC(t, x);

tau = D*v + C*[dt1; dt2] + G;

end
