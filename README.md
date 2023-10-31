# LivePeer Transcoding and Monitoring Setup

Welcome to my LivePeer transcoder setup! This repository houses an array of Docker files, scripts, configuration files, and resources that power my [LivePeer](https://livepeer.org/) transcoder. Additionally, it includes a robust monitoring system to keep a keen eye on both the transcoder and the overall system performance.

## System Information

### Components:

- **OS:** [Ubuntu 22.04](https://releases.ubuntu.com/jammy/) (Kernel version: 5.15.0-86-generic).
- **GPU:** 1x [NVIDIA GeForce GTX 1070 Ti](https://www.nvidia.com/en-us/geforce/news/nvidia-geforce-gtx-1070-ti/).
- **PSU:** [Corsair HX1200i](https://www.corsair.com/us/en/p/psu/cp-9020070-na/hxi-series-hx1200i-high-performance-atx-power-supply-1200-watt-80-plus-platinum-certified-psu-cp-9020070-na) PSU.

## System Benchmarking

Evaluate your system's performance using the [livepeer_bench](https://github.com/livepeer/go-livepeer/blob/master/cmd/livepeer_bench/livepeer_bench.go) tool. Find detailed instructions in the [official documentation](https://docs.livepeer.org/orchestrators/guides/benchmark-transcoding) on how to employ this tool effectively.

## Transcoding

I connect my LivePeer transcoder to the following pools:

- [LivePool](https://www.livepool.io/) (public pool)
- [TitanNode](https://titan-node.com/) (public pool)
- [video-miner](https://www.video-miner.com/) (private pool)
- [LivePeer.org](https://livepeer.org/) (main network)

### Pool Setup

For pool-specific setup instructions, refer to the documentation of the respective pool.

### Orchestrator Setup

#### On the Local Machine

For a step-by-step guide on configuring a LivePeer orchestrator with the main network, consult the [official LivePeer documentation](https://docs.livepeer.org/orchestrators/guides/get-started). Linux users can also follow this comprehensive [guide](https://hedgedoc.ddvtech.com/wpwHEXMFTueUM7jqhikTvw). If you've followed the documentation correctly, you can use the `scripts/start_livepeer_node_template.bash` script to start up your orchestrator.

> [!IMPORTANT]\
> Smooth LivePeer transcoder setup on Linux requires [CUDA 11.8](https://developer.nvidia.com/cuda-11-8-0-download-archive). The current version of [livepeer-go](https://github.com/livepeer/go-livepeer) does not yet support [CUDA 12.x](https://developer.nvidia.com/cuda-downloads). Follow the CUDA 11.8 installation steps outlined [here](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html). Additionally, confirm that you are using the GPU version of the [livepeer-go](https://github.com/livepeer/go-livepeer) binary.

#### Using Docker

This repository also contains a [livepeer docker compose file](livepeer/docker-compose.yml) that you can use to run your LivePeer orchestrator. For detailed instructions, check the [README](livepeer/README.md) in the livepeer folder.

## Monitoring

My monitoring setup follows the configuration outlined in this insightful [forum post](https://forum.livepeer.org/t/guide-transcoder-monitoring-with-prometheus-grafana). It incorporates tools for monitoring both the transcoder and the system's performance:

- [Prometheus](https://prometheus.io/): Data storage for monitoring.
- [Grafana](https://grafana.com): Visualization of monitoring data.
- [dcgm-exporter](https://github.com/NVIDIA/dcgm-exporter): Monitoring for my Nvidia GPU.
- [liquidctl](https://github.com/liquidctl/liquidctl) and [liquidctl-exporter](https://github.com/paha/liquidctl-exporter): Monitoring for my [Corsair HX1200i PSU](https://www.corsair.com/us/en/p/psu/cp-9020070-na/hxi-series-hx1200i-high-performance-atx-power-supply-1200-watt-80-plus-platinum-certified-psu-cp-9020070-na).
- [node-exporter](https://grafana.com/oss/prometheus/exporters/node-exporter/?tab=installation): System statistics monitoring.

### Usage

To get started, ensure your system meets the following prerequisites:

- [Ubuntu 22.04](https://releases.ubuntu.com/jammy/) (or higher).
- [Docker](https://docs.docker.com/engine/install/ubuntu/) (optional but recommended).
- [Nvidia GPU](https://www.nvidia.com/en-us/geforce/graphics-cards/30-series/rtx-3080/) (optional).
- [Nvidia driver](https://www.nvidia.com/Download/driverResults.aspx/172837/en-us) (optional).

Follow these steps:

1. **Clone this repository:**

   ```bash
   git clone git@github.com:rickstaa/livepeer-setup.git
   ```

2. **Launch the monitoring tools using Docker Compose:**

   ```bash
   docker-compose up -d
   ```

> [!IMPORTANT]\
> If you're using the [ufw](https://help.ubuntu.com/community/UFW) firewall, configure it to permit incoming connections from the `livepeer` Docker subnet to localhost on the specific exporter ports. For example, using the command:
>
> ```bash
> sudo ufw allow in from 172.19.0.0/16 to any port 9100
> ```
>
> This enables incoming traffic from the Docker network (subnet: 172.19.0.0/16) on port 9100.
