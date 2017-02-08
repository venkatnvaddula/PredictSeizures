clear
data = zeros(50,240000);
output= zeros(2,50);
k = 1;
for i= 1:6:143
    for j = i:i+5
        load(['1_' num2str(j) '_1.mat']);
        data(k,:) = data(k,:)+ sum(dataStruct.data,2).'; 
    end
    data(k,:) = abs(fft(data(k,:))); 
    k= k+1;
end
output(1,1:24)= 1;
for i=1:6:143
    for j = i:i+5
        load(['1_' num2str(j) '_0.mat']);
        data(k,:) =  sum(dataStruct.data,2).';
    end
   data(k,:) = abs(fft(data(k,:))); 
   k = k+1; 
end
output(2,25:50)= 1;
output = output.'; 