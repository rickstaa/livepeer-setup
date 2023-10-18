# My LivePeer Transcoding and Monitoring Setup

Welcome to my LivePeer transcoder setup! This repository houses the configuration for my [LivePeer](https://livepeer.org/) transcoder, along with a robust monitoring system to keep tabs on both the transcoder and the overall system performance.

## Transcoding

My setup involves connections to the following key endpoints:

- [LivePeer.org](https://livepeer.org/) (main network)
- [LivePool](https://www.livepool.io/) (pool)
- [TitanNode](https://titan-node.com/) (pool)

For a detailed guide on setting up a LivePeer transcoder, refer to the [official LivePeer documentation](https://livepeer.org/docs/transcoding). Additionally, for instructions specific to the pools mentioned above, consult their respective documentation on their official websites.

## Monitoring

My monitoring setup is based on the configuration presented in this insightful [forum post](https://forum.livepeer.org/t/guide-transcoder-monitoring-with-prometheus-grafana). It incorporates the following tools for monitoring both the transcoder and the system's performance:

- [Prometheus](https://prometheus.io/): Data storage for monitoring.
- [Grafana](https://grafana.com): Visualization of monitoring data.
- [dcgm-exporter](https://github.com/NVIDIA/dcgm-exporter): Monitoring for my Nvidia GPU.
- [liquidctl](https://github.com/liquidctl/liquidctl) and [liquidctl-exporter](https://github.com/paha/liquidctl-exporter): Monitoring for my [Corsair HX1200i PSU](https://www.corsair.com/us/en/p/psu/cp-9020070-na/hxi-series-hx1200i-high-performance-atx-power-supply-1200-watt-80-plus-platinum-certified-psu-cp-9020070-na).
- [node-exporter](https://grafana.com/oss/prometheus/exporters/node-exporter/?tab=installation): System statistics monitoring.

### Usage

For this setup to work properly, you'll need to have the following prerequisites installed on your system:

- [Ubuntu 20.04](https://ubuntu.com/download/desktop) (or a higher version).
- [Docker](https://docs.docker.com/engine/install/ubuntu/) (optional but recommended).
- [Nvidia GPU](https://www.nvidia.com/en-us/geforce/graphics-cards/30-series/rtx-3080/) (optional).
- [Nvidia driver](https://www.nvidia.com/Download/driverResults.aspx/172837/en-us) (optional).

Once you have the prerequisites installed, follow these steps to get started:

1. Clone this repository:

    ```bash
    git clone git@github.com:rickstaa/livepeer-setup.git
    ```

2. Run the following Docker Compose command to launch the monitoring tools:

    ```bash
    docker-compose up -d
    ```
