-module(sensor).
-export([start/2, loop/2]).

%% Starts a sensor with a unique ID and the PID of the central network
start(DeviceId, NetworkPid) ->
    spawn(sensor, loop, [DeviceId, NetworkPid]).

loop(DeviceId, NetworkPid) ->
    % Simulate waiting 3 seconds between sensor readings
    receive
    after 3000 ->
        % Generate a random temperature between 20 and 35 degrees Celsius
        Temperature = 20 + rand:uniform(15),
        
        % Send the data packet to the central network
        NetworkPid ! {iot_data, DeviceId, Temperature},
        
        % Repeat the loop to keep the device "alive"
        loop(DeviceId, NetworkPid)
    end.