% polinomia 1st order function by A.S.Munir
function [loc_x,loc_y,z_s] = polinomial1st(x,y,z)
    % parameter used, could be changged
    % x,y,z normalized value, 1 is unset, below 1 made value smaller,
    % above one made value bigger, only effect for calculation
    dx=1;   % dx different
    dy=1;   % dy different    
    r_x=1;   
    r_y=1;
    r_z=1;
    
    % make map bigger for visibility
    treshold_x=5*(max(x)-min(x))/100; 
    treshold_y=5*(max(y)-min(y))/100;

    x_map=floor(min(x)-treshold_x):dx:ceil(max(x)+treshold_x);
    y_map=floor(min(y)-treshold_y):dy:ceil(max(y)+treshold_y);
    [loc_x,loc_y]=meshgrid(x_map,y_map);
    z_s=zeros(length(x_map),length(y_map));

    % locating and normalized value
    n=length(z);
    x_r=x.*r_x;
    y_r=y.*r_y;
    z_r=z.*r_z;

    % solve by inverse
    H1=[n             sum(x_r)           sum(y_r);
        sum(x_r)      sum(x_r.^2)        sum(x_r.*y_r);
        sum(y_r)      sum(x_r.*y_r)      sum(y_r.^2)];
    H2=[sum(z_r);sum(z_r.*x_r);sum(z_r.*y_r)];
    %H3=inv(H1);
    an=H1\H2;

    for i = 1:length(z)
        index_i(i)=find(x(i)==x_map);
        index_j(i)=find(y(i)==y_map);
        z_s(index_i(i),index_j(i))=z(i);
    end

    for i = 1:length(x_map)
        for j = 1:length(y_map)
            %d=sqrt((x_map(i)-x).^2 +(y_map(j)- y).^2);
            if(z_s(i,j)==0)
                z_s(i,j)=an(1)+an(2)*x_map(i)./r_x+an(3)*y_map(j)./r_y;
                z_s(i,j)=z_s(i,j)./r_z;
            end
        end
    end
    
    % plotting the result
    figure(1)
    contourf(loc_x,loc_y,z_s)
    title ('1st Order')
    grid on
    hold on
    plot(x,y,'ro', 'MarkerSize', 10, 'LineWidth', 0.1)
    colorbar
    hold off
    figure(2)
    mesh(loc_x,loc_y,z_s)
    
end