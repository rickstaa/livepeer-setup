# LivePeer Orchestrator Setup

Welcome to the LivePeer Orchestrator Setup! This folder contains a [livepeer Docker Compose file](docker-compose.yml) designed to streamline the deployment of your LivePeer orchestrator. Before diving in, ensure your system aligns with the following prerequisites:

- [Ubuntu 22.04](https://releases.ubuntu.com/jammy/) (or later).
- [Docker](https://docs.docker.com/engine/install/ubuntu/) (optional but highly recommended).
- [Nvidia GPU](https://www.nvidia.com/en-us/geforce/graphics-cards/30-series/rtx-3080/) (optional).
- [Nvidia driver](https://www.nvidia.com/Download/driverResults.aspx/172837/en-us) (optional).
- [Nvidia container toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html).

Once these prerequisites are in place, follow the steps below to launch your LivePeer orchestrator.

## Usage

1. Start by renaming `config/lporch_template.cfg` to `config/lporch.cfg` and filling in the required fields.
2. Add a `.eth_password` file to this directory and input your Ethereum wallet password.
3. Ensure that this file has the correct permissions:

   ```bash
   sudo chmod 600 .eth_password
   ```

4. Launch the LivePeer orchestrator using Docker Compose:

   ```bash
   sudo docker compose up -d
   ```

5. Confirm that the orchestrator is running by executing `docker ps`.

Your LivePeer orchestrator is now set to transcode on port `8935`, with the LivePeer CLI server being exposed on port `7935`.

> \[WARNING]
> Ensure that you have root access for running Docker containers on your system. If you've previously followed [this guide](https://docs.docker.com/engine/install/linux-postinstall/) to enable Docker access for non-root users, please revert the steps outlined there. Failure to do so may expose your wallet password, as unauthorized users could potentially access it.

### Access LivePeer CLI server from outside the container

By default, you have to shell into the container to access the LivePeer CLI server. If you want to access it from outside the container, you can expose the port by uncommenting the following to the `docker-compose.yml` file:

```yaml
ports:
  # - 7936:7935 # Make CLI server available on host.
```

### Use a Pre-existing ETH Wallet

If you prefer using a pre-existing ETH wallet, follow these steps:

1. Stop the LivePeer orchestrator:

   ```bash
   sudo docker compose down
   ```

2. Shell into the LivePeer orchestrator container:

   ```bash
   sudo docker compose run --entrypoint /bin/bash livepeer-combined-orchestrator bash
   ```

3. In a new terminal, retrieve the container ID using `docker ps`.
4. Copy your wallet file to the container:

   ```bash
   sudo docker cp <wallet_file> <container_id>:/root/.lpData/
   ```

5. Exit the container and restart the LivePeer orchestrator:

   ```bash
   sudo docker compose up -d
   ```

## Additional Resources

Explore more in-depth guides and resources:

- [Awesome LivePeer Docker Installation](https://github.com/mikezupper/awesome-livepeer/tree/main/guides/docker-livepeer-install)
- [Authority Null's Docker Scaling Guide](https://forum.livepeer.org/t/guide-livepeer-with-docker-and-portainer-for-operating-at-scale/1850)
