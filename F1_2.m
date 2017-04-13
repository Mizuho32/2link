function [f] = F1_2(x)
global l1 l2 m1 m2 g

  t1 = x(:, 1)';
  t2 = x(:, 2)';
 dt1 = x(:, 3)';
 dt2 = x(:, 4)';
 
 f1 = 1/4*l1^2*m1.*sin(t1).*dt1.^2 ...
      -m2*(l1.*dt1 + 1/2*l2*(dt1+dt2)) ...
      .* (-l1*sin(t1).*dt1-1/2*l2*sin(t1+t2).*(dt1+dt2));
 f2 = (g*m1)/2+g*m2-1/4*l1^2*m1*cos(t1).*dt1.^2 ...
      -m2*(l1*dt1+1/2*l2*(dt1+dt2)).*(l1*cos(t1).*dt1+1/2*l2*cos(t1+t2).*(dt1+dt2));

 f = [f1; f2];
end