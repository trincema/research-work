startTime = datetime(2023,10,9,7,10,0,TimeZone="America/New_York");
stopTime = startTime + hours(2) + minutes(2);
sampleTime = 10;                                      %seconds
sc = satelliteScenario(startTime,stopTime,sampleTime);
viewer = satelliteScenarioViewer(sc);

trajectory = geoTrajectory([28.5567,77.1006,10600;13.1989,77.7068,30600;25.2566,55.3641,5600],[0,3600,3*3600],AutoPitch=true,AutoBank=true);
pltf = platform(sc,trajectory);
hide(pltf.Path);
show(pltf.GroundTrack);
play(sc);