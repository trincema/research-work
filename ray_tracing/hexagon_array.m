viewer = siteviewer("Basemap", "openstreetmap");

f = 20e9;

% Central point (latitude, longitude)
lat1 = 40.708619; % New York City latitude
lon1 = -74.010000; % New York City longitude
lat2 = 40.705904;
lon2 = -74.010029;

% 1. Creare Statie de Baza Emitator
% Pozitionati antena transmitatoare pe o cladire la alegere.
tx1 = txsite("Name", "Tx", ...
    "Latitude", lat1, ...
    "Longitude", lon1, ...
    "Antenna", design(dipole, f), ...
    "TransmitterFrequency", f);
% Afisare statie Tx in SiteViewer
show(tx1);
tx2 = txsite("Name", "Tx", ...
    "Latitude", lat2, ...
    "Longitude", lon2, ...
    "Antenna", design(dipole, f), ...
    "TransmitterFrequency", f);
% Afisare statie Tx in SiteViewer
show(tx2);

% Number of points to generate between the two points
num_points = 10;

% Generate locations between the two points
locations = generateLocationsBetweenPoints(lat1, lon1, lat2, lon2, num_points);

function rxSites = generateLocationsBetweenPoints(lat1, lon1, lat2, lon2, num_points)
    % Calculate step size for interpolation
    step_lat = (lat2 - lat1) / (num_points - 1);
    step_lon = (lon2 - lon1) / (num_points - 1);

    % Generate locations between the two points
    for i = 2:num_points-1
        % Interpolate latitude and longitude
        lat = lat1 + (i - 1) * step_lat;
        lon = lon1 + (i - 1) * step_lon;
        rx= rxsite("Name", "Tx", ...
            "Latitude", lat, ...
            "Longitude", lon, ...
            "ReceiverSensitivity", -90); % Units: dBm
        show(rx);
    end
end
