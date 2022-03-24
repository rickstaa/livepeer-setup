echo "Starting all livepeer monitoring services..."
sudo systemctl start prometheus.service
sudo systemctl start grafana-server
sudo systemctl start liquidctl-exporter.service
sudo systemctl start node_exporter.service
docker run -d --name dcgm-exporter --gpus all --rm -p 9400:9400 nvcr.io/nvidia/k8s/dcgm-exporter:2.3.5-2.6.5-ubuntu20.04 &> /dev/null
echo "Services started successfully."
