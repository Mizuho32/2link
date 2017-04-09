global ts kds kps tds dtds

r2d = @(ra) ra * 180 / pi;

% print thetad, theta
figure(2);
clf

tds_ode = x(:, 5:6)';

hold on;
plot(t, r2d(tds_ode(1,:)), t, r2d(x(:,1)))
plot(t, r2d(tds_ode(2,:)), t, r2d(x(:,2)))
plot(ts, r2d(tds(1,1:length(ts))), ts, r2d(tds(2,1:length(ts))));
legend('\thetad_1', '\theta_1', ...
       '\thetad_2', '\theta_2', ...
       '\thetad_1 direct', '\thetad_2 direct');
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
figure(4);
clf
hold on
plot(ts, kps(1,1:length(ts)), ts, kps(2,1:length(ts)));
plot(ts, kds(1,1:length(ts)), ts, kds(2,1:length(ts)));
legend('Kp_1', 'Kp_2', 'Kd_1', 'Kd_2');
hold off;

% print theta'
figure(5);
clf
hold on
plot(t, r2d(x(:,3)), t, r2d(x(:,4)));
plot(ts, r2d(dtds(1, 1:length(ts))), ts, r2d(dtds(2,1:length(ts))));
hold off
legend('d\theta_1', 'd\theta_2', 'd \thetad_1', 'd \thetad_2');