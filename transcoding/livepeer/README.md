# Streamlined LivePeer Orchestrator Setup

Welcome to the LivePeer Orchestrator Setup! In this folder, find a [livepeer Docker Compose file](docker-compose.yml) that simplifies the deployment of your LivePeer orchestrator. Before diving in, make sure your system checks off these prerequisites:

- [Ubuntu 22.04](https://releases.ubuntu.com/jammy/) (or later).
- [Docker](https://docs.docker.com/engine/install/ubuntu/) (optional but highly recommended).
- [Nvidia GPU](https://www.nvidia.com/en-us/geforce/graphics-cards/30-series/rtx-3080/) (optional).
- [Nvidia driver](https://www.nvidia.com/Download/driverResults.aspx/172837/en-us) (optional).
- [Nvidia container toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html).

Once the prerequisites are met, follow these steps to launch your LivePeer orchestrator.

## How to Use

### Start the Orchestrator

1. Kick things off by renaming `config/lporch_template.cfg` to `config/lporch.cfg` and filling in the required fields.
2. Add a `.eth_password.txt` file to this directory and input your Ethereum wallet password.
3. Ensure that the root user is the file owner:

   ```bash
   sudo chown root:root .eth_password.txt
   ```

4. Ensure the file has the correct permissions:

   ```bash
   sudo chmod 600 .eth_password.txt
   ```

5. Launch the LivePeer orchestrator using Docker Compose:

   ```bash
   sudo docker compose up
   ```

6. Confirm the orchestrator is on duty by executing `docker ps`.

Your LivePeer orchestrator is now ready to transcode on port `8935`, with the LivePeer CLI server exposed on port `7936`.

> \[!WARNING]
> Ensure root access for running Docker containers on your system. If you've previously followed [this guide](https://docs.docker.com/engine/install/linux-postinstall/) for non-root users, revert those steps. Failure to do so may expose your wallet password.

### Unleash the CLI Server

By default, you shell into the container to access the LivePeer CLI server. Want access from outside the container? Uncomment this in `docker-compose.yml`:

```yaml
ports:
  # - 7936:7935 # Make CLI server available on host.
```

### Use Pre-existing ETH Wallet

Prefer a pre-existing ETH wallet? Follow these steps:

1. Halt the LivePeer orchestrator:

   ```bash
   sudo docker compose down
   ```

2. Shell into the LivePeer orchestrator container:

   ```bash
   sudo docker compose run --entrypoint /bin/bash livepeer-combined-orchestrator bash
   ```

3. In a new terminal, get the container ID using `docker ps`.
4. Copy your wallet file to the container:

   ```bash
   sudo docker cp <wallet_file> <container_id>:/root/.lpData/
   ```

5. Exit the container and restart the LivePeer orchestrator:

   ```bash
   sudo docker compose up
   ```

## Deep Dive Resources

For more insights and guides, explore:

- [Awesome LivePeer Docker Installation](https://github.com/mikezupper/awesome-livepeer/tree/main/guides/docker-livepeer-install)
- [Authority Null's Docker Scaling Guide](https://forum.livepeer.org/t/guide-livepeer-with-docker-and-portainer-for-operating-at-scale/1850)
