trdata = zeros(2346,16);
trout = zeros(2346,1);
p = 1;
for i=1:2196
    load(['2_' num2str(i) '_0.mat']);
    trdata(i,:) = trdata(i,:) + sum(dataStruct.data,1);
end
for i=2197:2346
    load(['2_' num2str(p) '_1.mat']);
    trdata(i,:) = trdata(i,:) + sum(dataStruct.data,1);
    p = p+1;
    trout(i,1) = 1;
end

tsdata = zeros(1302,16);
tsout = zeros(1302,1);
pt = 1;
for i=1:1152
    load(['1_' num2str(i) '_0.mat']);
    tsdata(i,:) = tsdata(i,:) + sum(dataStruct.data,1);
end
for i=1153:1302
    load(['1_' num2str(pt) '_1.mat']);
    tsdata(i,:) = tsdata(i,:) + sum(dataStruct.data,1);
    pt = pt+1;
    tsout(i,1) = 1;
end

% deleting rows with zeros
%rows tsdata( ~any(tsdata,2), : ) = []; 
%columns trdata( :, ~any(trdata,1) ) = [];
 
 
% prediction using selected models
tspredcomplextrees = ComplexTree.predictFcn(tsdata);
complextreeMSE = immse(tsout,tspredcomplextrees);
%plotconfusion(tsout,tspredcomplextrees)

tspredquadiscrimination = quadiscrimination.predictFcn(tsdata);
quadiscriminationMSE = immse(tsout,tspredquadiscrimination);
%plotconfusion(tsout,tspredquadiscrimination)

tspredcubicSVM = cubicSVM.predictFcn(tsdata);
cubicSVMMSE = immse(tsout,tspredcubicSVM);
%plotconfusion(tsout,tspredcomplextrees)

tspredfineKNN = fineKNN.predictFcn(tsdata);
fineKNNMSE = immse(tsout,tspredfineKNN);
%plotconfusion(tsout,tspredcomplextrees)

tspredsubspaceKNN = subspaceKNN.predictFcn(tsdata);
subspaceKNNMSE = immse(tsout,tspredsubspaceKNN);
%plotconfusion(tsout,tspredcomplextrees)

tspredlogisticRegression = logisticRegression.predictFcn(tsdata);
logisticRegressionMSE = immse(tsout,tspredlogisticRegression);
%plotconfusion(tsout,tspredcomplextrees)

tspredsimpleTree = simpleTree.predictFcn(tsdata);
simpleTreeMSE = immse(tsout,tspredsimpleTree);
%plotconfusion(tsout,tspredcomplextrees)

tspredlogisticRegression = logisticRegression.predictFcn(tsdata);
logisticRegressionMSE = immse(tsout,tspredlogisticRegression);
%plotconfusion(tsout,tspredcomplextrees)

tspredlogisticRegression = logisticRegression.predictFcn(tsdata);
logisticRegressionMSE = immse(tsout,tspredlogisticRegression);
%plotconfusion(tsout,tspredcomplextrees)

tspredlogisticRegression = logisticRegression.predictFcn(tsdata);
logisticRegressionMSE = immse(tsout,tspredlogisticRegression);
%plotconfusion(tsout,tspredcomplextrees)

% filters - fft
trdata1 = trdata;
trdata1 = abs(fft(trdata1(:,:)));
 
 