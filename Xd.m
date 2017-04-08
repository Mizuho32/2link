function [v] = Xd(t)
global R deltaR f phi

  %r = (R + deltaR*sin(20*pi*f*t));
  r = R;
  v = [ r.*cos(2*pi*f*(t + phi))
        r.*sin(2*pi*f*(t + phi)) ];

  %v = [t.*0 - 0.9848;t.*0 - 0.1736];
end