close all
s = tf('s') ;

% G = 200 * (-s+1) / ((s+1)*(10*s+1));
% 
% Gd = (20 / (100*s + 1)) ;
% Gm= exp(-0.5*s);
% 
% hold all
% margin(G)
% margin(Gd)
% margin(G*Gm)
% legend('G','Gd','G Gm')

G = 1/(s+1);
G1= 1/(s+1)^2;
G2= 1/(s+1)^3;
hold all
 margin(G)
 margin(G1)
 margin(G2)
 legend('G','G1','G2')