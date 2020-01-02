clear;clc;
T = readtable('inven.csv', 'HeaderLines',1);
T2 = table2array(T);
x=T2(:,1);
y=T2(:,2);
z=T2(:,3);

[lat,lon,z_s]=idw(x,y,z);

%[lat,lon,z_s]=polinomial1st(x,y,z)

%[lat,lon,z_s]=polinomial2nd(x,y,z)

