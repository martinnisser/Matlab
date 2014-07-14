close all
s = tf('s') ;

G = 2 * (s-1) / (s+2);
Ga = 10 / (0.2*s +1) ;
Gd = (2/ (10*s + 1)) ;

hold all
bode(G*Ga)
bode(Gd)
legend('G Ga','Gd')