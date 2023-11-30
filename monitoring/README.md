# Monitoring

Welcome to the LivePeer setup of the [transcode.ninja](https://transcode.ninja/) orchestrator. Following the insightful guidance of this [forum post](https://forum.livepeer.org/t/guide-transcoder-monitoring-with-prometheus-grafana), our monitoring setup is a blend of precision and efficiency, covering both transcoder and system performance.

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

1. **Clone this Repository with its submodules:**

   ```bash
   git clone --recurse-submodules git@github.com:transcodeninja/livepeer-setup.git
   ```

2. **Launch the Monitoring Tools with Docker Compose:**

   ```bash
   docker compose up -d
   ```

3. **Re-create the library panels:** Unfortunately, Grafana does [not yet support provisioning of library panels](https://github.com/grafana/grafana/issues/46247). This means you must manually re-create and re-link the library panels in the `livepeer_payements_overview.json` and `psu_overview.json` dashboards. This is a one-time task.

4. **Setup alerting**: The dashboards have various alerts. It's essential to configure your [Grafana notification policies and contact points](https://grafana.com/docs/grafana/latest/alerting/) to ensure you receive these alerts on your preferred channel.

> [!IMPORTANT]\
> If you're using the [ufw](https://help.ubuntu.com/community/UFW) firewall, set it to welcome incoming connections from the `livepeer` Docker subnet to localhost on the specific exporter ports. For instance, use this command:
>
> ```bash
> sudo ufw allow in from 172.19.0.0/16 to any port 9100
> ```
>
> This opens the door for incoming traffic from the Docker network (subnet: 172.19.0.0/16) on port 9100.
