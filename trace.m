r2d = @(ra) ra * 180 / pi;

% print thetad, theta
figure(2);
clf

tds = x(:, 5:6)';

hold on;
plot(t, r2d(tds(1,:)), t, r2d(x(:,1)))
plot(t, r2d(tds(2,:)), t, r2d(x(:,2)))
legend('\thetad_1', '\theta_1', ...
       '\thetad_2', '\theta_2');
hold off;

% print e
figure(3);
clf

es = x(:, 7:8)';
hold on;
plot(t, r2d(es(1, :)), t, r2d(es(2,:)))
legend('e_1', 'e_2');
hold off

% print F and thetad'
global Fs
len = 0:(length(Fs)-1);
figure(4);
clf
hold on
plot(len, Fs(1,:), len, Fs(2,:));
plot(len, r2d(dtds(1, :)), len, r2d(dtds(2,:)));
legend('F_1', 'F_2', 'd \thetad_1', 'd \thetad_2');
hold off;

% print theta'
figure(5);
clf
plot(t, r2d(x(:,3)), t, r2d(x(:,4)));
legend('d\theta_1', 'd\theta_2');