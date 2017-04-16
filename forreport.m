figure(7)

[c1, c2] = arm(x');

subplot(2,1,1);
plot(t, c1(1,:));
xlabel('time [s]');
ylabel('x [m]');
title('x成分');

subplot(2,1,2)
plot(t, c2(2,:));
xlabel('time [s]');
ylabel('y [m]');
title('y成分');

figure(8)
clf

hold on;
plot(c1(1,:), c1(2,:));
plot(c2(1,:), c2(2,:));

xlabel('x');
ylabel('y');
title('xyプロット');
hold off

figure(9);
clf

xd = Xd(t');
plot(xd(1,:), xd(2,:));