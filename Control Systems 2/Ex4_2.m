% Control Systems 2 ; Problem Set 4

% Ex 2 : 1 RHP zero and rel degree 1, and L is stable
% but book doesn't demand rel degree 2 when there's a rhp zero
% and wer're using this formula with the weighting.

close all
s= tf('s');

L = (4-s) / ( (s+1)*(s+2));
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
Integ= trapz(S)

figure
[abs, phase, w] = bode(S); % default mag is absolute

for i=[1:53]
    temp(i)= abs(1,1,i); % mag is one-dimensional for SISO systems
    dB(i) = 20*log10(temp(i)); % convert to dB
    weight(i) = 2*4 / (4^2 + w(i).^2);
    weighted_Mag(i) = dB(i) .* weight(i);
end
%Mag = 10.^(deciB./20); % convert dB to abs magnitude
plot(w(1:40),weighted_Mag(1:40))