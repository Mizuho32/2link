function [tau] = tau_PDg(t, x)
global l1 l2 m1 m2 g

t1  = x(1);
t2  = x(2);

c1 = 1/2*l1*m1*g*cos(t1) + m2*g*(l1*cos(t1)+1/2*l2*cos(t1+t2));
c2 = 1/2*l2*m2*g*cos(t1+t2);

G = [ c1
      c2 ];
    
[tau, ~, ~] = F_PDg(t, x, G);

end
