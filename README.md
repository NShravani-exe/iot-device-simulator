# 🌐 Smart IoT Device Simulator in Erlang

A lightweight, concurrent IoT device simulator built using **Erlang**. This project leverages Erlang's actor model and process architecture to simulate independent smart sensors (e.g., temperature gauges) concurrently broadcasting telemetry data to a centralized gateway network.

## 🚀 Features
- **Concurrent Execution:** Each simulated IoT device runs inside its own isolated Erlang process (`spawn`).
- **Real-Time Data Streams:** Generates and transmits simulated telemetry data packet metrics every few seconds.
- **Centralized Gateway Architecture:** A dedicated network listener dynamically receives and logs active updates from all live nodes.

## 📂 File Structure
- `sensor.erl`: Logic for simulating individual smart device processes and data generation.
- `network.erl`: Central gateway network infrastructure that boots and monitors active sensor units.

## 🛠️ How to Run Locally

### Prerequisites
Make sure you have Erlang/OTP installed on your machine.

### Execution Steps
1. Clone the repository and open your terminal inside the project directory:
   ```bash
   git clone [https://github.com/NShravani-exe/iot-device-simulator.git]
   cd iot-device-simulator