# My LivePeer setup

This repository contains all the files I use in my [LivePeer](https://livepeer.org/) setup.

## Transcoding

### Pools

- https://www.livepool.io/
- https://titan-node.com/

## Monitoring

For monitoring my Orchestrator/Transcoder I use extended the setup that was given in this [forum post](https://forum.livepeer.org/t/guide-transcoder-monitoring-with-prometheus-grafana).

## Monitor PSU

I also monitor my corsair HX1200i PSU using the [liquidctl](https://github.com/liquidctl/liquidctl) utility. I had to install this utility using pip since the snap version has a permission bug. I then used the [liquidctl-exporter](https://github.com/paha/liquidctl-exporter) to export the data for Grafana. When doing this you have to make sure
the `LIQUIDCTL_EXPORTER_PATH` environmental variable points to the Liquidctl executable (i.e. `LIQUIDCTL_EXPORTER_PATH="/home/ricks/.local/bin/liquidctl"`).

### Start main monitoring services

You can start the required monitoring services by using [systemd](https://grafana.com/docs/grafana/latest/installation/debian/#start-the-server-with-systemd). To do so fill in and move the `services/nvidia_exporter_template.service`, `prometheus_template.service` to your `/etc/systemd/system` folder. The service files for Grafana are already created during the Grafana installation. Please use `sudo systemctl daemon-reload` if you decide to change configuration files when the deamon is running.

#### Start Prometheus

To start [prometheus](https://prometheus.io/) use the following commands:

```bash
sudo systemctl start prometheus.service
sudo systemctl status prometheus.service
```

#### Start Grafana

To [start Grafana](https://grafana.com/docs/grafana/latest/installation/debian/#start-the-server-with-systemd) use the following commands:

```bash
sudo systemctl start grafana-server
sudo systemctl status grafana-server
```

#### Start dcgm-exporter

To start the [dcgm-exporter](https://github.com/NVIDIA/dcgm-exporter) tool use the following commands:

```bash
docker run -d --gpus all --rm -p 9400:9400 nvcr.io/nvidia/k8s/dcgm-exporter:2.3.5-2.6.5-ubuntu20.04
```

### Start liquidctl-exporter

To start the [liquidctl-exporter](https://github.com/paha/liquidctl-exporter) tool use the following commands:

```bash
sudo systemctl start liquidctl-exporter.service
sudo systemctl status liquidctl-exporter.service
```

### Start node-exporter

To start the [node-exporter](https://grafana.com/oss/prometheus/exporters/node-exporter/?tab=installation) tool use the following commands:

```bash
sudo systemctl start liquidctl-exporter.service
sudo systemctl status liquidctl-exporter.service
```
