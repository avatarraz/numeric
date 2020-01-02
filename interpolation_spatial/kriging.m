clear;clc;
T = readtable('inven.csv', 'HeaderLines',1);
T2 = table2array(T);
x=T2(:,1);
y=T2(:,2);
z=T2(:,3);

p=2;    % power for weight function
dx=1;   % dx different
dy=1;   % dy different
% function ---- to be translated
treshold_x=5*(max(x)-min(x))/100;
treshold_y=5*(max(y)-min(y))/100;

x_map=floor(min(x)-treshold_x):dx:ceil(max(x)+treshold_x);
y_map=floor(min(y)-treshold_y):dy:ceil(max(y)+treshold_y);

[loc_x,loc_y]=meshgrid(x_map,y_map);
z_s=zeros(length(x_map),length(y_map));

for i = 1:length(z)
    index_i(i)=find(x(i)==x_map);
    index_j(i)=find(y(i)==y_map);
    z_s(index_i(i),index_j(i))=z(i);
end

for i = 1:length(x_map)
    for j = 1:length(y_map)
        d=sqrt((x_map(i)-x).^2 +(y_map(j)- y).^2);
        R=max(d);
        for k=1:length(d)
            w1(k)=((1./d(k))^2)./(sum((1./d).^2));
            w2(k)=(((R-d(k))./(R.*d(k)))^2)./(sum(((R-d)./(R*d)).^2));
        end
    if(z_s(i,j)==0)
        z_s(i,j)=sum(z.*w2');
    end
        
    end
end
figure(1)
contourf(loc_x,loc_y,z_s)
title ('IDW Interpolation')
grid on
hold on
plot(x,y,'ro', 'MarkerSize', 10, 'LineWidth', 0.1)
colorbar
hold off
figure(2)
mesh(loc_x,loc_y,z_s)