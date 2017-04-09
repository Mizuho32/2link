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

Kp = [ 10 0
       0 20 ];
Kd = [ 50 0
       0 20 ];

R      = 1.2;
deltaR = 0.2;
f      = 0.25;
global phi
phi    = 1.0;

% debug
global ts Fs kds kps dtds tds
ts = [];
Fs = [];
kps = [];
kds = [];
dtds = [];
tds = [];

td_0 = xy2t(Xd(0));
dt1_0 = 0;
dt2_0 = 0;

de  = td_0 - td_0;

time = [0 4];

[t, x] = ode45('deltaPDg', time, [td_0; dt1_0; dt2_0; td_0; de]);