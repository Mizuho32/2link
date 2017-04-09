function [q] = xy2t_2(x)
%global l1 l2
l1 = 0.5;
l2 = 1;
  l = sqrt( x(1,:).^2 + x(2,:).^2 );
  theta = atan2(x(2,:), x(1,:));
  tmp1 = acos( (l2^2-(l.^2+l1^2))./(-2*l*l1) );
  tmp2 = acos( (l1^2-(l.^2+l2^2))./(-2*l*l2) );
  q = [ theta - tmp1 
        tmp1  + tmp2 ];
end