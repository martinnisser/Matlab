% Control 2 ; Exercise 3 (f)

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
K_th_w = 4.6; 
K_w_I  = 0.08;% gain for I chosen so that I doesnt exceed the value of I
             % from part (b) i.e. 0.365: looking at your diagram it is the
             % error in w that is multiplied by this gain, which yields I,
             % and the max possible value for that is max(w) minus zero,
             % i.e. 4.6. so 4.6*gain <0.365, or gain<= 0.365/4.6,  so we
             % choose gain= 0.08
G_w_I  = Km/(J*s + B);

T = feedback(K_w_I*G_w_I, 1 ) ; % see notebook for "T"

figure
hold all
Closed_Loop_theta = feedback(K_th_w * T * G_th_w, 1 );
step(Closed_Loop_theta);

W = K_th_w * T / (1 + K_th_w * T * G_th_w) ;
step(W);

I = K_th_w *(T / G_w_I) / (1 + K_th_w * T * G_th_w) ;
step(I);

legend('CL theta','omega W', 'Current I')

figure
hold all
margin(Closed_Loop_theta)
margin(I)
margin(K_w_I*G_w_I)
margin(G_w_I)
legend('CL theta','CL I', 'KG','G')
