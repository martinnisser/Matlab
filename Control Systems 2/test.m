% Control 2
%testing figure 5.4 on page 170

close all
s= tf('s');

L = 2*(s-10)/(s*(s+10))

bode(L)

% d = TF*2;
% 
% hold all
% 
% bode(TF)
hold all


%typing stuff for experimenting in git


% still writing stuff
