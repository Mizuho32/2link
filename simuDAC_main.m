global l1 l2 m1 m2 I1 I2 g
global Kp Kd
global R deltaR f F

g = 9.8;

l1 = 0.5;
l2 = 1.0;

m1 = 2.0;
m2 = 1.0;

I1 = 0.1;
I2 = 0.01;

Kp = [ 120 0
       0 120 ];
Kd = [ 100 0
       0 120 ];

R      = 1.2;
deltaR = 0.2;
f      = 0.25;
F      = 2*pi*f;
global phi
phi    = 1.0;

t_0   = xy2t_2(Xd(-1));
dt1_0 = 0;
dt2_0 = 0;
td_0 =  xy2t_2(Xd(0));
e  = td_0 - t_0;

const = [t_0; dt1_0; dt2_0; td_0; e];

sim('simuDAC.slx');