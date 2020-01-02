function [x_predict,err_value]=gauss_seidel(x_value,y_value,err)
    min_corelation=err;
    n=size(x_value,1);
    x_predict=ones(1,size(x_value,2));
    err_value=ones(1,size(x_value,2))+min_corelation;
    error=mean(err_value);
    while (error>min_corelation && error<=1001)
    %for j = 1:10
    x_predict_temp=x_predict;
    for i = 1:n
        x_predict(i)=(y_value(i) - ...
                     (sum(x_value(i,:)*x_predict(:))-x_value(i,i)*x_predict(i))) / ...
                      x_value(i,i);
        err_value(i) = abs( (x_predict(i) - x_predict_temp(i))/x_predict(i) ) * 100;
    end
    error=mean(err_value);
    end
end
