echo "Starting all livepeer monitoring services..."
sudo systemctl start prometheus.service
sudo systemctl start grafana-server
sudo systemctl start nvidia-exporter.service
sudo systemctl start liquidctl-exporter.service
echo "Services started successfully."
