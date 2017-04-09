function [theta] = xy2t(xd)

  qi = [ 0.1;  0 ];
  
  epsilon = 0.1;
  
  x = t2xy2(qi);
  
  while sqrt(sum((x-xd).^2 )) > 0.05
    t1 = qi(1);
    t2 = qi(2);
    
    x = t2xy2(qi);

    qi = qi + epsilon * transpose(J(t1,t2)) * (xd-x);
  end

  theta = qi;
end