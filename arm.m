function [cont1, cont2] = arm(td)
global l1 l2

  cont1 = [ l1.*cos(td(1,:))
            l1.*sin(td(1,:)) ];
  cont2 = [ l1.*cos(td(1,:)) + l2.*cos(td(1,:)+td(2,:))
            l1.*sin(td(1,:)) + l2.*sin(td(1,:)+td(2,:)) ];
end