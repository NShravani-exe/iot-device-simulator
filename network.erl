-module(network).
-export([start/0, listen/0]).

%% Starts the central network gateway
start() ->
    NetworkPid = spawn(network, listen, []),
    io:format("Central IoT Network started.~n"),
    
    % Spin up 3 simulated IoT devices
    sensor:start("sensor_living_room", NetworkPid),
    sensor:start("sensor_kitchen", NetworkPid),
    sensor:start("sensor_bedroom", NetworkPid),
    
    io:format("3 IoT Devices successfully deployed and broadcasting!~n"),
    ok.

%% Listens for incoming data packets from sensors
listen() ->
    receive
        {iot_data, DeviceId, Temp} ->
            io:format("[ALERT] Received from ~s -> Temp: ~p°C~n", [DeviceId, Temp]),
            listen()
    end.