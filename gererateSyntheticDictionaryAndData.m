function [data, coefs] = gererateSyntheticDictionaryAndData(Omega, N, L)


% randn('state',sum(100*clock));
rand('state',sum(100*clock));

Dictionary = Omega; %randn(dim,K);


[data,coefs] = CreateDataFromDictionarySimple(Dictionary, N, L);


% %=============================================
% % Display original dictionary 
% %=============================================
% figure;
% displayDictionaryElementsAsImage(Dictionary, 50, 1,1,20,0);
% title('Original dictionary');
% set(gcf,'units','normalized','position',[0,0,1,0.935]);
% 
% %=============================================
% % Display original signal 
% %=============================================
% figure;
% displayDictionaryElementsAsImage(data, 10, 5,5,5,0);
% title('Original signal');
% set(gcf,'units','normalized','position',[0,0,1,0.935]);

function [X,xOrig] = CreateDataFromDictionarySimple(dictionary, numElements, numCoef)
maxRangeOfCoef = 1;
resolution = 0.0001;
n=4;
N=numElements;
[p,d]=size(dictionary);

xOrig = zeros(size(dictionary,2),numElements);

coefs = rand(numCoef,numElements)*maxRangeOfCoef;  %randn
xOrig(1:numCoef,:) = coefs;
for i=1:size(xOrig,2)
    xOrig(:,i) = xOrig(randperm(size(xOrig,1)),i);
end
xOrig=normcols(xOrig);

X = dictionary*xOrig;



X=normcols(X);
%S=abs(dictionary*X)<1e-6;


