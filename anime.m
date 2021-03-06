figure(1);

clf

[x1, y1] = t2xy1(x);
X2 = t2xy2(x');
x2 = X2(1,:);
y2 = X2(2,:);


[p1_x0, p1_y0] = t2xy1(td_0(1));
p2_0 = t2xy2(td_0);
p2_x0 = p2_0(1,:);
p2_y0 = p2_0(2,:);

%f1 = F1(x);
%f1_2 = F1_2(x);
%max_f1 = max(abs(f1));
%max_f1_2 = max(diag(sqrt(f1_2'*f1_2)));
max_Fc = max(diag(sqrt(Fc'*Fc)));

hold on
plot(0,0, 'o');
contour = Xd(t');
plot(contour(1,:), contour(2,:));

tex = text(1.5,1.5, sprintf('%f', 0));
e   = text(1.5,1.2, sprintf('%f',  0));

[tdrefx1,tdrefy1] = t2xy1(x(:, 5:6));
tdref1 = plot(0, 0, '*');
tdref = t2xy2(x(:, 5:6)');
tdrefx2 = tdref(1,:);
tdrefy2 = tdref(2,:);
tdref2 = plot(0, 0, '*');
ref = plot(0, 0, 'X');
p1 = plot(p1_x0, p1_y0, 'o');
p2 = plot(p2_x0, p2_y0, 'o');

v_f1 = quiver(0, 0, 0, 0);

hold off
axis manual

xlim([-2 2]);
ylim([-2 2]);

now = 0;

for i = 1:length(x1)
  p1.XData = x1(i);
  p1.YData = y1(i);
  
  p2.XData = x2(i);
  p2.YData = y2(i);
  
  ref.XData = contour(1, i);
  ref.YData = contour(2, i);
  
  tdref1.XData = tdrefx1(i);
  tdref1.YData = tdrefy1(i);
  tdref2.XData = tdrefx2(i);
  tdref2.YData = tdrefy2(i);
  
  tex.String = sprintf('%f', t(i));
  e.String   = sprintf('%f', E(x(i,:)));
  
  %r = [x1(i); y1(i)];
  %r = f1(i)/max_f1 * (r/norm(r));
  tmp = Fc(:, i)/max_Fc;
  v_f1.UData = tmp(1);
  v_f1.VData = tmp(2);
  
  drawnow
  pause(1*(t(i) - now));
  now = t(i);
end