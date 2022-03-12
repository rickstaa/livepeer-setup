# My LivePeer setup

This repository contains all the files I use in my [LivePeer](https://livepeer.org/) setup.

## Monitoring

For monitoring my Orchestrator/Transcoder I use extended the setup that was given in this [forum post](https://forum.livepeer.org/t/guide-transcoder-monitoring-with-prometheus-grafana).

## Monitor PSU

If you have a corsair I series PSU you can also monitor it using [this Grafana dashboard](https://grafana.com/grafana/dashboards/12101). For this dashboard to work you first have to install the [lm-sensors](https://github.com/lm-sensors/lm-sensors) package and the [corsairpsu](https://github.com/Benzhaomin/corsairpsu) module.

### Start main monitoring services

You can start the required monitoring services by using [systemd](https://grafana.com/docs/grafana/latest/installation/debian/#start-the-server-with-systemd). To do so fill in and move the `services/nvidia_exporter_template.service`, `prometheus_template.service` to your `/etc/systemd/system` folder. The service files for Grafana are already created during the Grafana installation.

#### Start Grafana

To [start Grafana](https://grafana.com/docs/grafana/latest/installation/debian/#start-the-server-with-systemd) use the following commands:

```bash
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server
```

#### Start Prometheus

To prometheus use the following commands:

```bash
sudo systemctl daemon-reload
sudo systemctl start prometheus.service
sudo systemctl status prometheus.service
```

#### Start Nvidia_exporter

To the nvidia_exporter tool use the following commands:

```bash
sudo systemctl daemon-reload
sudo systemctl start nvidia_exporter.service
sudo systemctl status nvidia_exporter.service
```

### Start additional power monitoring services
