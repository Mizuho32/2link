function [x] = t2xy2(t)
  global l1 l2
  
  t1 = t(1,:);
  t2 = t(2,:);
  
  x = [ l1*cos(t1) + l2*cos(t1+t2)
        l1*sin(t1) + l2*sin(t1+t2) ];
end