# Monitoring

Welcome to my LivePeer monitoring setup. Following the insightful guidance of this [forum post](https://forum.livepeer.org/t/guide-transcoder-monitoring-with-prometheus-grafana), my monitoring setup is a blend of precision and efficiency, covering both transcoder and system performance.

## Monitoring Arsenal

- [Prometheus](https://prometheus.io/): Your data powerhouse for monitoring.
- [Grafana](https://grafana.com): Elevate your monitoring game with dynamic visualizations.
- [dcgm-exporter](https://github.com/NVIDIA/dcgm-exporter): Keep a keen eye on your Nvidia GPU.
- [liquidctl](https://github.com/liquidctl/liquidctl) and [liquidctl-exporter](https://github.com/paha/liquidctl-exporter): Monitor your [Corsair HX1200i PSU](https://www.corsair.com/us/en/p/psu/cp-9020070-na/hxi-series-hx1200i-high-performance-atx-power-supply-1200-watt-80-plus-platinum-certified-psu-cp-9020070-na) with precision.
- [node-exporter](https://grafana.com/oss/prometheus/exporters/node-exporter/?tab=installation): Comprehensive system statistics at your fingertips.

## Getting Started

Ensure your system is ready for the monitoring journey by meeting these prerequisites:

- [Ubuntu 22.04](https://releases.ubuntu.com/jammy/) (or higher).
- [Docker](https://docs.docker.com/engine/install/ubuntu/) (optional but recommended).
- [Nvidia GPU](https://www.nvidia.com/en-us/geforce/graphics-cards/30-series/rtx-3080/) (optional).
- [Nvidia driver](https://www.nvidia.com/Download/driverResults.aspx/172837/en-us) (optional).

### How to Use

1. **Clone this Repository:**

   ```bash
   git clone git@github.com:rickstaa/livepeer-setup.git
   ```

2. **Launch the Monitoring Tools with Docker Compose:**

   ```bash
   docker compose up -d
   ```

> [!IMPORTANT]\
> If you're sailing with the [ufw](https://help.ubuntu.com/community/UFW) firewall, set it to welcome incoming connections from the `livepeer` Docker subnet to localhost on the specific exporter ports. For instance, use this command:
>
> ```bash
> sudo ufw allow in from 172.19.0.0/16 to any port 9100
> ```
>
> This opens the door for incoming traffic from the Docker network (subnet: 172.19.0.0/16) on port 9100.
