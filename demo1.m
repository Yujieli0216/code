clc
clear
close all


% Set problem dimensions
n=6; 
d=n^2;
%d=n^2; % signal dimension
r=1; % subspace dimension for each signal 
N=40; % number of training signals


D=GenerateOmegaDIF(n);
%D=rand(d,d);
D=normcols(D);

Omega=pinv(D);
p=size(D,1); 
%Omega=normrows(Omega);

[Y, H] = gererateSyntheticDictionaryAndData(D, N, r);
Y=normrows(Y);

h1=figure;
DisplayOmega(Omega,h1);
[X ratio  DET]=IVM_QP(Y,d,Omega);


figure;   
plot(ratio*100,'-k');



