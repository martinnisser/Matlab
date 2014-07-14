% Control Systems 2 ; Problem Set 4

% Ex 1 : no RHP zeros and rel degree of at least 2, and L is stable

close all
s= tf('s');

L = 1 / ( (s+1)*(s+2));
Closed_Loop = feedback(L, 1 ) % which is equal to T

S = 1- Closed_Loop ; % which is equal to S, as S+T = 1

hold all
margin(L);
margin(Closed_Loop);
margin(S)
legend('Open Loop','Closed Loop (or T)', 'S')

figure
hold
pzmap(L)
pzmap(Closed_Loop)

% "Trapezoidal Integration (an approximate integration)
% to compute the Bode sensitivity integral, which is just
% integral of ln|S| from 0 to inf (and ln of mag S is exactly what
% is plotted in the Bode Y axis.
Integ= trapz(S)

% for no RHP zeros and rel degree of at least 2, the integral
% should be zero, which it is, and we verify it graphically by
% plotting normally
figure
P=bodeoptions;
P.FreqScale='linear';
P.MagScale = 'linear';
bode(S,P)