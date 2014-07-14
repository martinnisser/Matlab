% Control 2 ; Exercise 3

close all

R = 1;
L = 0.03;
Ka = 0.1;
Km = 0.1;
J = 0.0005;
B = 0.0002;

s = tf('s');


G = Km / ( s * (J*s + B) * (L*s + R + Ka*Km) );

G_th_w = 1/s ;
K_th_w = 4.6; % gain for omega, chosen so omega doesnt exceed the value of omega
             % from part (b) i.e. just under 4.6, as looking at your
             % diagram, the max possible  error in theta from a step input
             % for theta will be 1, at the very beginning, which is
             % multiplied by K_th_w to give omega.

% to plot step response yourself, must convert to closed loop TF
figure
hold all
Closed_Loop_theta = feedback(K_th_w*G_th_w, 1 ); % arguments are G and H (=1)
step(Closed_Loop_theta);

W = K_th_w / (1 + K_th_w*G_th_w) ;
step(W)
legend('CL theta','omega W')

figure
hold all
margin(Closed_Loop_theta)
margin(W)
margin(K_th_w*G_th_w)
margin(G_th_w)
legend('CL theta','CL omega W', 'KG','G')

sisotool(Closed_Loop_theta)