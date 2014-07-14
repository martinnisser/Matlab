% Control Systems 2 ; Problem Set 4

% Ex 3 : no RHP zero, and L is NOT stable (1 RHP pole)

% L has just one RHP pole at 1, so the integral should 
% equal pi * 1 = pi.
% Using formula 5.5 in book, as it is the criteria of the
% first waterbed formula that are satisfied

close all
s= tf('s');

L = 5 / ( (s-1)*(s+2));
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
legend('Open Loop','Closed Loop (or T)')

% "Trapezoidal Integration (an approximate integration)
% to compute the Bode sensitivity integral, which is just
% integral of ln|S| from 0 to inf (and ln of mag S is exactly what
% is plotted in the Bode Y axis.


[abs, phase, w] = bode(S); % default mag is absolute
for i=[1:50]
    temp(i)= abs(1,1,i);
    dB(i) = 20*log10(temp(i));
end
Integ= trapz(dB,temp)

