close all
clear all
clc

theta_1 = input('Enter Link-1 angle in degrees: ');
angular_vel_1 = input('Enter Link-1 angular velocity in rad/sec: ');
theta_2 = 120;

%if theta_1 > 120 
%    theta_2 = 360 + theta_2;
%end
    


%theta_1 = theta_1 * pi/180
%theta_2 = theta_2 * pi/180


l1x = 1*(cosd(theta_1));
l1y = 1*(sind(theta_1));

l2x = 2*(cosd(theta_2));
l2y = 2*(sind(theta_2));

h = l1y + l2y;
h_dash = 3 - h;

init_len_part = abs(l2x)-l1x

Range = 10 + init_len_part

theta = (h_dash + sqrt((h_dash^2) + (Range^2))) / Range
theta = atand(theta)
%theta_rad = theta * pi/180

Vo = sqrt(9.8 * (h_dash + sqrt((h_dash^2) + (Range^2))))

y = Range * tand(theta) - ((9.8 *(Range^2)) / (2*(Vo^2)*((cosd(theta))^2)))

time = Range / (Vo * cosd(theta))
x_points = []
y_points = []
for i = 0:0.001:time
    x = Vo * i * cosd(theta)
    x_points = [x_points,x]
    
    y = (Vo * i * sind(theta)) - ((1/2)*9.8*(i^2))
    y = y + h
    y_points = [y_points,y]
end
x_points_with_init_part = x_points - init_len_part

x_line = [9.56,9.78,10,10.22,10.44]
y_line = [3,3,3,3,3]


Output_1 = ['Angle for Link-2 = ',num2str(theta),' degrees']; 
Output_2 = ['Angular velocity of link-2 = ', num2str(Vo/2),' rad/sec'];

disp(Output_1)
disp(Output_2)



theta_l1 = linspace(0,theta_1,angular_vel_1);
theta_l2 = linspace(0,120,Vo/2);


for k = 1:length(theta_l1)
    THETA1 = theta_l1(k);
    for j = 1:length(theta_l2)
        THETA2 = theta_l2(j);
        
        x0 = 0;
        y0 = 0;
        
        x1 = 1*cosd(THETA1);
        y1 = 1*sind(THETA1);
        
        x2 = x1 + 2*cosd(THETA2);
        y2 = y1 + 2*sind(THETA2);
        
        plot([x0 x1],[y0 y1],[x1 x2],[y1 y2],'linewidth',2)
        grid on
        axis([-2 11 -1 8])
        pause(0.1)
               
        
    end
end

      
hold on
plot(x_points_with_init_part, y_points, 'r'), xlabel('Range'), ylabel('Height'), title('Basket Ball shooting'),
grid on, axis equal
hold on 
plot(x_line,y_line, 'b')















