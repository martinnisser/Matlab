% Control 2 ; Exercise 3

% adding stuff for linux

R = 1;
L = 0.03;
Ka = 0.1;
Km = 0.1;
J = 0.0005;
B = 0.0002;

s = tf('s');


TF = Km / ( s * (J*s + B) * (L*s + R + Ka*Km) );

sisotool(TF)

margin(TF)


