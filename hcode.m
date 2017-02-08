data = zeros(391,16);
output= zeros(391,1);
k = 1;
for i= 1:6:145
    for j = i:i+5
        load(['2_' num2str(j) '_1.mat']);
        data(k,:) = data(k,:)+ sum(dataStruct.data,1); 
    end
    data(k,:) = (fft(data(k,:))); 
    k= k+1;
end

for i=1:6:2191
    for j = i:i+5
        load(['2_' num2str(j) '_0.mat']);
        data(k,:) =  data(k,:) + sum(dataStruct.data,1);
    end
   data(k,:) = (fft(data(k,:))); 
   k = k+1; 
end


testdata = zeros(217,16);
testoutput = zeros(217,1);
kt = 1;
for i= 1:6:1147
    for j = i:i+5
        load(['1_' num2str(j) '_0.mat']);
        testdata(kt,:) = testdata(kt,:)+ sum(dataStruct.data,1); 
    end
    testdata(kt,:) = abs(fft(testdata(kt,:))); 
    kt= kt+1;
end
testoutput(kt:217,1)=1;
for i= 1:6:145
    for j = i:i+5
        load(['1_' num2str(j) '_1.mat']);
        testdata(kt,:) = testdata(kt,:)+ sum(dataStruct.data,1); 
    end
    testdata(kt,:) = abs(fft(testdata(kt,:))); 
    kt= kt+1;
end


decisionPredn = Decisiontrees.predictFcn(testdata);

KNNPredn = KNN.predictFcn(testdata);

LogisticPredn = Logistic.predictFcn(tes;oitdata);


mseRSUBoost = immse(decisionPredn,testout)

plotconfusion(testout,decisionPredn)

CEDecision = testoutput*log(decisionPredn) + (1-testoutput)*log(1-decisionPredn);

