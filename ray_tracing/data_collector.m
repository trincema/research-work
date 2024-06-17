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

maxAltitude = 35;
index = 1;
rxs1 = generateCircularRxArray(center_lat, center_long, 20, 13, maxAltitude, f, index);
index = index + 13;
rxs2 = generateCircularRxArray(center_lat, center_long, 30, 19, maxAltitude, f, index);
index = index + 19;
rxs3 = generateCircularRxArray(center_lat, center_long, 40, 25, maxAltitude, f, index);
index = index + 25;
rxs4 = generateCircularRxArray(center_lat, center_long, 50, 31, maxAltitude, f, index);
index = index + 31;
rxs5 = generateCircularRxArray(center_lat, center_long, 60, 38, maxAltitude, f, index);
index = index + 38;
rxs6 = generateCircularRxArray(center_lat, center_long, 70, 44, maxAltitude, f, index);
index = index + 44;
rxs7 = generateCircularRxArray(center_lat, center_long, 80, 50, maxAltitude, f, index);
index = index + 50;
rxs8 = generateCircularRxArray(center_lat, center_long, 90, 57, maxAltitude, f, index);
index = index + 57;
rxs9 = generateCircularRxArray(center_lat, center_long, 100, 63, maxAltitude, f, index);
index = index + 63;
rxs10 = generateCircularRxArray(center_lat, center_long, 110, 69, maxAltitude, f, index);
index = index + 69;
rxs11 = generateCircularRxArray(center_lat, center_long, 120, 75, maxAltitude, f, index);
index = index + 75;
rxs12 = generateCircularRxArray(center_lat, center_long, 130, 82, maxAltitude, f, index);
index = index + 82;
rxs13 = generateCircularRxArray(center_lat, center_long, 140, 88, maxAltitude, f, index);
index = index + 88;
rxs14 = generateCircularRxArray(center_lat, center_long, 150, 94, maxAltitude, f, index);
index = index + 94;
rxs15 = generateCircularRxArray(center_lat, center_long, 160, 101, maxAltitude, f, index);
index = index + 101;
rxs16 = generateCircularRxArray(center_lat, center_long, 170, 107, maxAltitude, f, index);
index = index + 107;
rxs17 = generateCircularRxArray(center_lat, center_long, 180, 113, maxAltitude, f, index);
index = index + 113;
rxs18 = generateCircularRxArray(center_lat, center_long, 190, 119, maxAltitude, f, index);
index = index + 119;
rxs19 = generateCircularRxArray(center_lat, center_long, 200, 126, maxAltitude, f, index);
index = index + 126;
rxs20 = generateCircularRxArray(center_lat, center_long, 210, 132, maxAltitude, f, index);
index = index + 132;
rxs21 = generateCircularRxArray(center_lat, center_long, 220, 138, maxAltitude, f, index);
index = index + 138;
rxs22 = generateCircularRxArray(center_lat, center_long, 230, 145, maxAltitude, f, index);
index = index + 145;
rxs23 = generateCircularRxArray(center_lat, center_long, 240, 151, maxAltitude, f, index);
index = index + 151;
rxs24 = generateCircularRxArray(center_lat, center_long, 250, 157, maxAltitude, f, index);
index = index + 157;
rxs25 = generateCircularRxArray(center_lat, center_long, 260, 163, maxAltitude, f, index);
index = index + 163;
rxs26 = generateCircularRxArray(center_lat, center_long, 270, 170, maxAltitude, f, index);
index = index + 170;
rxs27 = generateCircularRxArray(center_lat, center_long, 280, 176, maxAltitude, f, index);
index = index + 176;
rxs28 = generateCircularRxArray(center_lat, center_long, 290, 182, maxAltitude, f, index);
index = index + 182;
rxs29 = generateCircularRxArray(center_lat, center_long, 300, 188, maxAltitude, f, index);
index = index + 188;
rxs30 = generateCircularRxArray(center_lat, center_long, 310, 195, maxAltitude, f, index);
index = index + 195;
rxs31 = generateCircularRxArray(center_lat, center_long, 320, 201, maxAltitude, f, index);
index = index + 201;
rxs32 = generateCircularRxArray(center_lat, center_long, 330, 207, maxAltitude, f, index);
index = index + 207;
rxs33 = generateCircularRxArray(center_lat, center_long, 340, 214, maxAltitude, f, index);
index = index + 214;
rxs34 = generateCircularRxArray(center_lat, center_long, 350, 220, maxAltitude, f, index);
index = index + 220;
rxs35 = generateCircularRxArray(center_lat, center_long, 360, 226, maxAltitude, f, index);
index = index + 226;
rxs36 = generateCircularRxArray(center_lat, center_long, 370, 232, maxAltitude, f, index);
index = index + 232;
rxs37 = generateCircularRxArray(center_lat, center_long, 380, 239, maxAltitude, f, index);
index = index + 239;
rxs38 = generateCircularRxArray(center_lat, center_long, 390, 245, maxAltitude, f, index);
index = index + 245;
rxs39 = generateCircularRxArray(center_lat, center_long, 400, 251, maxAltitude, f, index);
index = index + 251;
rxs40 = generateCircularRxArray(center_lat, center_long, 410, 258, maxAltitude, f, index);
index = index + 258;
rxs41 = generateCircularRxArray(center_lat, center_long, 420, 264, maxAltitude, f, index);
index = index + 264;
rxs42 = generateCircularRxArray(center_lat, center_long, 430, 270, maxAltitude, f, index);
index = index + 270;
rxs43 = generateCircularRxArray(center_lat, center_long, 440, 276, maxAltitude, f, index);
index = index + 276;
rxs44 = generateCircularRxArray(center_lat, center_long, 450, 283, maxAltitude, f, index);
index = index + 283;
rxs45 = generateCircularRxArray(center_lat, center_long, 460, 289, maxAltitude, f, index);
index = index + 289;
rxs46 = generateCircularRxArray(center_lat, center_long, 470, 295, maxAltitude, f, index);
index = index + 295;
rxs47 = generateCircularRxArray(center_lat, center_long, 480, 302, maxAltitude, f, index);
index = index + 302;
rxs48 = generateCircularRxArray(center_lat, center_long, 490, 308, maxAltitude, f, index);
index = index + 308;
rxs49 = generateCircularRxArray(center_lat, center_long, 500, 314, maxAltitude, f, index);
index = index + 314;
disp("Total: " + index);

rxs = [rxs1;rxs2;rxs3;rxs4;rxs5;rxs6;rxs7;rxs8;rxs9;rxs10;...
       rxs11;rxs12;rxs13;rxs14;rxs15;rxs16;rxs17;rxs18;rxs19;rxs20;...
       rxs21;rxs22;rxs23;rxs24;rxs25;rxs26;rxs27;rxs28;rxs29;rxs30;...
       rxs31;rxs32;rxs33;rxs34;rxs35;rxs36;rxs37;rxs38;rxs39;rxs40;...
       rxs41;rxs42;rxs43;rxs44;rxs45;rxs46;rxs47;rxs48;rxs49];



function rxSites = generateCircularRxArray(baseLat, baseLon, ...
        cellRadius, rxCount, maxAltitude, f, index)
    distUnits = 'm';
    arclen = rad2deg(cellRadius/earthRadius(distUnits));
    rxSites = rxsite.empty(length(rxCount), 0);
    
    % Calculate the new points
    for i = 1:rxCount
        % Calculate the Rx coordinate
        azimuth = i * (360 / rxCount);
        disp("azimuth: " + azimuth + " arclen: " + arclen);
        [rx_lat, rx_lon] = reckon(baseLat, baseLon, arclen, azimuth);
        % Create Rx site
        rx = rxsite("Name", "Rx" + i, ...
            "Latitude", rx_lat, ...
            "Longitude", rx_lon, ...
            "Antenna", design(dipole, f), ...
            "ReceiverSensitivity", -90); % Units: dBm
        disp("Rx" + (index + i - 1) + ": " + "lat: " + rx_lat + ", lon: " + rx_lon + ...
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
