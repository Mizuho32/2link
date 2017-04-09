xd = Xd(0:0.05:4);
td = xy2t_2(xd);
[c1, c2] = arm(td);

clf
hold on
plot(xd(1,:), xd(2,:));
plot(c1(1,:), c1(2,:), 'b*');
plot(c2(1,:), c2(2,:), 'r+');
hold off