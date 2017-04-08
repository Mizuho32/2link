function [x,y] = t2xy1(X)
  global l1
  
  t = X(:, 1);
  x = l1*cos(t);
  y = l1*sin(t);
end