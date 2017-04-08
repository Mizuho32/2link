global l1 l2 m1 m2 I1 I2 g
global Kp Kd
global R deltaR f

g = 9.8;

l1 = 0.5;
l2 = 1.0;

m1 = 2.0;
m2 = 1.0;

I1 = 0.1;
I2 = 0.01;

%magic number on circle
%Kp = 30;
%Kd = 30;
Kp = 100;
Kd = 25;

R      = 1;
deltaR = 0;
f      = 0.5;


t1_0 = 0;
t2_0 = 0.1;
dt1_0 = 0;
dt2_0 = 0;

time = [0 2];

[t, x] = ode45('deltaPD', time, [t1_0; t2_0; dt1_0; dt2_0]);