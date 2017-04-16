function [f] = Fc_DAC(t, x)
global l1 l2 m1 m2 g

x = x';

lg1 = 1/2*l1;
lg2 = 1/2*l2;

 t1 = x(1, :);
 t2 = x(2, :);
dt1 = x(3, :);
dt2 = x(4, :);

tau1 = zeros(size(t))';
tau2 = tau1;

f1 = (lg1.*m1+l1.*m2).*cos(t1).*(dt1).^2+((-l1.*(lg1.*m1+l1.*m2).*cos(t1-t2).*sin(t1)+(lg1.^2.*m1+l1.^2.*m2).*sin(t2)).*(tau2-g.*lg2.*m2.*cos(t2)+l1.*lg2.*m2.*sin(t1-t2).*(dt1).^2))/(lg2.*(lg1.^2.*m1+l1.^2.*m2-l1.^2.*m2.*cos(t1-t2).^2))+lg2.*m2.*cos(t2).*(dt2).^2-(((2.*lg1.*m1+l1.*m2).*sin(t1)+l1.*m2.*sin(t1-2.*t2)).*(-tau1+g.*(lg1.*m1+l1.*m2).*cos(t1)+l1.*lg2.*m2.*sin(t1-t2).*(dt2).^2))/(2.*lg1.^2.*m1+l1.^2.*m2-l1.^2.*m2.*cos(2.*(t1-t2)));
f2 = -g.*(m1+m2)+(lg1.*m1+l1.*m2).*sin(t1).*(dt1).^2+((l1.*(lg1.*m1+l1.*m2).*cos(t1).*cos(t1-t2)-(lg1.^2.*m1+l1.^2.*m2).*cos(t2)).*(tau2-g.*lg2.*m2.*cos(t2)+l1.*lg2.*m2.*sin(t1-t2).*(dt1).^2))/(lg2.*(lg1.^2.*m1+l1.^2.*m2-l1.^2.*m2.*cos(t1-t2).^2))+lg2.*m2.*sin(t2).*(dt2).^2+(((lg1.*m1+l1.*m2).*cos(t1)-l1.*m2.*cos(t1-t2).*cos(t2)).*(-tau1+g.*(lg1.*m1+l1.*m2).*cos(t1)+l1.*lg2.*m2.*sin(t1-t2).*(dt2).^2))/(lg1.^2.*m1+l1.^2.*m2-l1.^2.*m2.*cos(t1-t2).^2);

f = [f1; f2];
end