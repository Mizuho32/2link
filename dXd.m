function [v] = dXd(t)
global R deltaR f phi
  
  t = t + phi;
  r1 = 20*pi*f*deltaR*cos(20*pi*f*t);
  r2 = (R + deltaR*sin(20*pi*f*t));
  v = [ r1.*cos(2*pi*f*t) - 2*pi*f*r2.*sin(2*pi*f*t)
        r1.*sin(2*pi*f*t) + 2*pi*f*r2.*cos(2*pi*f*t) ];
  %v = [ -2*pi*f*R.*sin(2*pi*f*(t + phi))
  %       2*pi*f*R.*cos(2*pi*f*(t + phi)) ];
  %v = [t.*0; t.*0];
end