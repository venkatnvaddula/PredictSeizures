clear
data = zeros(391,240000);
output= zeros(1,391);
k = 1;
for i= 1:6:145
    for j = i:i+5
        load(['2_' num2str(j) '_1.mat']);
        data(k,:) = data(k,:)+ sum(dataStruct.data,2).'; 
    end
    data(k,:) = abs(fft(data(k,:))); 
    k= k+1;
end
output(1,1:25)= 1;

for i=1:6:2191
    for j = i:i+5
        load(['2_' num2str(j) '_0.mat']);
        data(k,:) =  data(k,:) + sum(dataStruct.data,2).';
    end
   data(k,:) = abs(fft(data(k,:))); 
   k = k+1; 
end

output = output.'; 

testdata = zeros(217,1);
kt = 1;
for i= 1:6:1147
    for j = i:i+5
        load(['1_' num2str(j) '_0.mat']);
        testdata(kt,:) = testdata(kt,:)+ sum(dataStruct.data,1); 
    end
    testdata(kt,:) = abs(fft(testdata(kt,:))); 
    kt= kt+1;
end

for i= 1:6:145
    for j = i:i+5
        load(['1_' num2str(j) '_1.mat']);
        testdata(kt,:) = testdata(kt,:)+ sum(dataStruct.data,1); 
    end
    testdata(kt,:) = abs(fft(testdata(kt,:))); 
    kt= kt+1;
end

testout = zeros(217,1);
testout(193:217,1) = 1;
testdata = testdata.';
testout = testout.';
