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

latitude1 = 40.724196;
latitude2 = 40.718484;
longitude1 = -74.004651;
longitude2 = -73.992835;
width = 0;
