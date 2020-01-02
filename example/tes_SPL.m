clear;clc;
min_corelation=0.1;
x_value=[4 -1 -1; 
        -2  6  1; 
        -1  1  7];

y_value=[3;
         9;
         -6];

% gauss-jordan     
disp ('gauss jordan   :')
c=[x_value,y_value];
reult=rref(c) % matlab function: Reduced row echelon form (Gauss-Jordan)

% gauss-seidel
disp ('gauss seidel   :')
[x,error]=gauss_seidel(x_value,y_value,0.1)

