% Variables
f = 2.6e9;
antHeight = 25; % [m]
power = 10; % [w]
numCellSites = 7; % 7, 19
isd = 1500; % Inter-site distance [m]

buildings = readgeotable("manhattan.osm",Layer="buildingparts");
uniqueMaterials = unique(buildings.Material);
materials = ["","brick","concrete","copper","glass","metal","plaster","stone"]; 
colors = ["#D3D3D3","#AA4A44","#D3D3D3","#B87333","#35707E","#151513","#FFFFFF","#301934"];
dict = dictionary(materials,colors);
numBuildings = height(buildings);
for n = 1:numBuildings
    material = buildings.Material(n);
    buildings.Color(n) = dict(material);
end
% Deschide fereastra SiteViewer cu definire Basemap si Buildings
viewer = siteviewer("Basemap", "openstreetmap", "Buildings", buildings);
% viewer = siteviewer("Basemap", "openstreetmap");

% Central point (latitude, longitude)
center_lat = 40.708619; % New York City latitude
center_long = -74.010000; % New York City longitude

% 1. Creare Statie de Baza Emitator
% Pozitionati antena transmitatoare pe o cladire la alegere.
tx = txsite("Name", "Tx", ...
    "Latitude", center_lat, ...
    "Longitude", center_long, ...
    "Antenna", design(dipole, f), ...
    "TransmitterFrequency", f);
% Afisare statie Tx in SiteViewer
tx.AntennaHeight = 25;
show(tx);
pattern(tx);

radiusStep = 100;
cellRadius = 500;
rxArraySize = 25;
rxs = generateCircularRxArray(center_lat, center_long, cellRadius, rxArraySize, 400, f);

for i = 1:length(rxs)
    pattern(rxs(i), f, "Transparency", 0.6, "Size", 30);
    pause(5);
end

function rxSites = generateCircularRxArray(baseLat, baseLon, ...
        cellRadius, rxCount, maxAltitude, f)
    distUnits = 'm';
    arclen = rad2deg(cellRadius/earthRadius(distUnits));
    rxSites = rxsite.empty(length(rxCount), 0);
    
    % Calculate the new points
    for i = 1:rxCount
        % Calculate the Rx coordinate
        azimuth = i * (360 / rxCount);
        disp("azimuth: " + azimuth);
        [rx_lat, rx_lon] = reckon(baseLat, baseLon, arclen, azimuth);
        % Create Rx site
        rx = rxsite("Name", "Rx" + i, ...
            "Latitude", rx_lat, ...
            "Longitude", rx_lon, ...
            "Antenna", design(dipole, f), ...
            "ReceiverSensitivity", -90); % Units: dBm
        disp("Rx" + i + ": " + "lat: " + rx_lat + ", lon: " + rx_lon + ...
            ", azimuth: "+ azimuth + " [deg], elevation: " + elevation(rx));
        rxSites(i) = rx;
        if (maxAltitude == -1) || (elevation(rx) <= maxAltitude)
            show(rx);
            while ~isvalid(rx)
                pause(0.1);
            end
        end
    end
end