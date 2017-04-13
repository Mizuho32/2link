global l1 l2 m1 m2 I1 I2 g

g = 9.8;

l1 = 0.5;
l2 = 1.0;

m1 = 2.0;
m2 = 1.0;

I1 = 0.1;
I2 = 0.01;

R      = 1.4;
deltaR = 0;
f      = 0.25;

t1_0 = -pi/2;%0;
t2_0 = 0;%pi/4;
dt1_0 = 0;
dt2_0 = 0;

time = [0 10];

[t, x] = ode45('delta', time, [t1_0; t2_0; dt1_0; dt2_0]);

x(:,5:6) = [t t];