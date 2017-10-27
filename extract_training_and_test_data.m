function [training_data,training_labels,test_data,test_labels] = extract_training_and_test_data(data_file_path, labels_file_path)

data = load(data_file_path);  
data=data.data;
values = load(labels_file_path);
values = values.labels;

rand = randperm(size(data,1),size(data,1));

training_data = zeros(size(data,1)*9/10 ,35);
training_labels = zeros(size(data,1)*9/10,1);

test_data = zeros(size(data,1)/10,35);
test_labels = zeros(size(data,1)/10,1);
j=1;

for i = 1 : size(data,1)
    if i<= size(training_data,1)
        training_data(i,:) = data(rand(i),:);
        training_labels(i) = values(rand(i));
    else
        test_data(j,:) = data(rand(i),:);
        test_labels(j) = values(rand(i));
        j=j+1;
    end
end

save('training_data.mat', 'training_data');
save('training_labels.mat','training_labels');
save('test_data.mat', 'test_data');
save('test_labels.mat','test_labels');
end


