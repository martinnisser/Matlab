% Control 2 ; Exercise 3

% adding stuff for linux

close all 

R = 1;
L = 0.03;
Ka = 0.1;
Km = 0.1;
J = 0.0005;
B = 0.0002;

s = tf('s');


G = Km / ( s * (J*s + B) * (L*s + R + Ka*Km) );

sisotool(G)

K = 0.01 *(3*s +1) / (0.03*s + 1);

margin(G),
hold all
margin(K)
margin(K*G)
legend('G','K','KG')


G_th_w = 1/s ;
G_w_I  = Km/(J*s + B);
G_I_V  = 1/(L*s + R + Ka*Km);

% to plot step response yourself, must convert to closed loop TF
figure
hold all
Closed_Loop = feedback(K*G, 1 ); % arguments are G and H (=1)
step(Closed_Loop);

% Finding the resulting w, I and V , for a step in the reference for theta
% i.e. doing the step response for theta, which is plotting the resulting
% theta for a reference of theta=1, and seeing what w, I and V  are
% generated: this is done by grabbing the values at their respective points
% in block diagram: easy to understand by looking at the cascade diagram in
% your notebook
% e.g. for w, take the complete closed loop TF, and only divide by G_th_w
% as once you go around the loop to go from the OL to CL TF, that's the
% only constant between w and theta (the system output). And working
% further left you get the others, finally with the innermost loop, V.

W = K*G / (G_th_w*(1 + K*G)) ;
I = W/ G_w_I ;
V = I / G_I_V;
step(W)
[w,t] = step(W); % just to extract maximum omega value
max(w)           % just to extract maximum omega value
step(I)
step(V)
legend('CL theta','omega W','Current I','Voltage v')




% Following: Was trying to find w, I and V through a rough differentiation


% count= 1
% p=polyfit(t,y,7)    % fit a curve to the step response
%  
%  
% Y= diff(y); % difference between consec. y data, so vector is 1 shorter
% W= Y./0.005;
% plot(t(1:92),W)
% A = diff(W); % so length 91
% A= A./0.005; % divide by time to make a derivative
%  
% for q = [1:91]     % must as A is length 91, but W is length 92
% I(q) = J.*A(q) + B.*W(q);
% end
% I= I./Km;
% plot(t(1:91),I)
% 
% % Didn't do I (current) yet



