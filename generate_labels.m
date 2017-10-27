function [labels] = generate_labels(number_of_labels, ocurrences)

labels = zeros(number_of_labels * ocurrences,1);
for i=0:number_of_labels-1
   for j=1:ocurrences
       labels(ocurrences*i + j) = i;
   end
end
save('labels.mat', 'labels');

end
