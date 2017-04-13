function [f] = F1_2(x)
global l1 l2 m1 m2 g

  t1 = x(:, 1)';
  t2 = x(:, 2)';
 dt1 = x(:, 3)';
 dt2 = x(:, 4)';
 
 f1 = -(1/4)*l1*(l1*(m1+4*m2)*cos(t1).*(dt1).^2+2*l2*m2*cos(t2).*(dt2).^2);
 f2 = g*m1+g*m2+1/4*l1^2*m1*(-sin(t1).*(dt1).^2)+l1*m2*(-l1*sin(t1).*(dt1).^2-1/2*l2*sin(t2).*(dt2).^2);

 f = [f1; f2];
end