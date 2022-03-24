echo "Stopping all livepeer monitoring services..."
sudo systemctl stop prometheus.service
sudo systemctl stop grafana-server
sudo systemctl stop liquidctl-exporter.service
sudo systemctl start node_exporter.service
docker kill dcgm-exporter &> /dev/null
echo "Services stopped successfully."
