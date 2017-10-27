function y = predict(test_data_file_name)
X = load(test_data_file_name);
X= X.test_data;
X(:,size(X,2)+1)= 1;
[N D] = size(X);
y = zeros(N,1);

%--------------------------------------------------------------------------
%--------------------- TUTAJ WLASNA IMPLEMENTACJA -------------------------
%--------------------------------------------------------------------------
w = load('w');
w=w.w;
v = load('v');
v=v.v;
for i = 1:size(X,1)
    x = X(i,:);
    p=sigmoid(x*v');
    m =(exp(w * p'));
    [M,I] = max(m);
    y(i,1)=I-1;
    disp(y(i,1));
end
end