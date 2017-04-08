function [m] =  J(t1,t2)
  global l1 l2
  
  m = [ -l1*sin(t1)-l2*sin(t1+t2), -l2*sin(t1+t2)
         l1*cos(t1)+l2*cos(t1+t2), +l2*cos(t1+t2) ];
end