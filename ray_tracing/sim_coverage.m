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

rtpm = propagationModel("raytracing", Method="sbr");
rtpm.Method = "sbr";
rtpm.MaxNumReflections = 1;
rtpm.MaxNumDiffractions = 1;
coverage(tx,rtpm, ...
    SignalStrengths=-120:-5, ...
    MaxRange=500, ...
    Resolution=3, ...
    Transparency=0.6);
