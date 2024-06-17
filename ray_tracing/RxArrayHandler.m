classdef RxArrayHandler
    methods
        % maxAltitude ignored if negative
        function rxSites = generateCircularRxArray(baseLat,baseLon,distanceMeters,rxCount, maxAltitude)
            distUnits = 'm';
            arclen = rad2deg(distanceMeters/earthRadius(distUnits));
            rxSites = rxsite.empty(length(rxCount), 0);
            
            % Calculate the new points
            for i = 1:rxCount
                % Calculate the Rx coordinate
                azimuth = i * (360 / rxCount);
                disp("azimuth: " + azimuth);
                [rx_lat, rx_lon] = reckon(baseLat, baseLon, arclen, azimuth);
                % Create Rx site
                rx = rxsite("Name", "Tx", ...
                    "Latitude", rx_lat, ...
                    "Longitude", rx_lon, ...
                    "ReceiverSensitivity", -90); % Units: dBm
                disp("Rx" + i + ": " + "lat: " + rx_lat + ", lon: " + rx_lon + ...
                    ", azimuth: "+ azimuth + " [deg], elevation: " + elevation(rx));
                if (maxAltitude >= 0 && elevation(rx) <= maxAltitude)
                    rxSites(i) = rx;
                    show(rx);
                end
            end
        end

        % 
        function generateHexagonalRxArray(baseLat, baseLon, distanceMeters, rxCount, maxAltitude)
        
            disp("");
        end
    end
end