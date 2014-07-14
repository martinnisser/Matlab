close all
s = tf('s') ;

%G = (1 * s + 1)/(s^2 + 2*0.8*2*s + 2^2);

G = (s-0.5);
G1 = (s-1);
G2 = (s-3);
G3 = (s-5);
% 
% S = 1/ (1 + G)
% S1 = 1/ (1 + G1)
% S2 = 1/ (1 + G2)
% S3 = 1/ (1 + G3)

S = G/ (1 + G)
S1 = G1/ (1 + G1)
S2 = G2/ (1 + G2)
S3 = G3/ (1 + G3)


hold all
margin(S)
margin(S1)
margin(S2)
margin(S3)

sisotool(S2)

% ss2tf(