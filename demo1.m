clc
clear
close all


% Set problem dimensions
n=5; 
d=n^2;
%d=n^2; % signal dimension
r=15; % subspace dimension for each signal 
N=2000; % number of training signals


%D=GenerateOmegaDIF(n);
D=rand(d,d);
D=normcols(D);

Omega=pinv(D);
p=size(D,1); 
Omega=normrows(Omega);

[X, H] = gererateSyntheticDictionaryAndData(D, N, r);

h1=figure;
DisplayOmega(Omega,h1);
[X ratio  DET]=IVM_QP(X,d,Omega);






