% Central point (latitude, longitude)
center_lat = 40.7128; % New York City latitude
center_long = -74.0060; % New York City longitude

% Radius (in kilometers)
radius = 10; % For example, 10 km radius

% Number of points
num_points = 100; % Number of points on the circle

% Generate equidistant points
angles = linspace(0, 2*pi, num_points+1);
angles = angles(1:end-1);
points_x = center_long + radius * cos(angles * pi / 180);
points_y = center_lat + radius * sin(angles * pi / 180);

% Plot the circle and central point
figure;
hold on;
plot(center_long, center_lat, 'ro'); % Central point
plot(points_x, points_y, 'b'); % Circle
xlabel('Longitude');
ylabel('Latitude');
title('Ring of locations');
axis equal;
grid on;

% Display the coordinates
disp('Latitude:');
disp(points_y);
disp('Longitude:');
disp(points_x);
