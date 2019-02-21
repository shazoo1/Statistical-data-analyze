inputstddev = 2;
inputmean = 10;
samplesize = 1000;

results = zeros(1,1000);
sample_sizes = [2,5,10,20,50,100,200,500,1000];
devs = [];
expected_devs = [];

for i=1:length(sample_sizes)
        means = zeros(1,1000);
        for j=1:1000
            vector1 = inputmean + randn(sample_sizes(i),1)*inputstddev;
            means(j) = mean(vector1)
        end
        stDeviation = std(means)
        devs(end+1) = stDeviation;
        expected_devs(end+1) = 2 / sqrt(sample_sizes(i))
end

figure; hold on;
plot(sample_sizes, devs, 'b-o');
plot(sample_sizes, expected_devs, 'r-');
xlabel('Sample size');
ylabel('Uncertainty of the mean');
hold off;

legend('Real deviation','Expected deviation')