function [w,v] = mlp()

xTrain = load('training_data.mat');
xTrain = xTrain.training_data;
yTrain = load('training_labels.mat');
yTrain = yTrain.training_labels;

maxiter = 10;

alpha = 0.11; 
miniBatch = 9;
features = 35;
class_number = 4;

w = (rand(class_number,features)-0.5)/class_number;
v= (rand(features,features+1)-0.5)/class_number;
miniBatches = (size(xTrain,1)/miniBatch);

for t= 1:maxiter
    reg = alpha/t;
   for i=1:miniBatch
       Y = zeros(class_number,miniBatches); 
       pack = xTrain(((1 * miniBatches* (i-1))+1):(1 * miniBatches* (i)),:);
       pack(:,size(pack,2)+1)= 1;
        k =1;
        for j = ((1 * miniBatches* (i-1))+1):(1 * miniBatches* (i)) 
            Y(yTrain(j)+1,k) =1;
            k=k+1;
        end
        
         theta = sigmoid((pack *v')); 
        thetat = theta';
        lic = exp(w*thetat);
        sumy = sum(lic,1);
        mian = repmat(sumy,class_number,1);
        P = lic ./mian;
        yp = (Y-P);
        
        v = v + reg* (w'* yp .* thetat .* (1-thetat)) * pack;
        w = w + reg* yp * theta;
   end
 end
save('w.mat', 'w');
save('v.mat','v');
   fprintf('Wcisnij klawisz, aby kontynuowac...\n\n');
    pause;
end
