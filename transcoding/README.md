# Transcoding

Welcome to the heart of my transcoding setup with LivePeer! I've fine-tuned this toolkit to connect my LivePeer transcoder/orchestrator to various pools and the main network, ensuring optimal performance across different networks.

## Supported Pools

- [LivePool](https://www.livepool.io/) (public pool)
- [TitanNode](https://titan-node.com/) (public pool)
- [video-miner](https://www.video-miner.com/) (private pool)
- [LivePeer.org](https://livepeer.org/) (main network)

### Pool Setup

Get started with pool-specific setup instructions by referring to the documentation of the respective pool or exploring the [pools/README.md](pools/README.md).

## Orchestrator Setup

### Local Machine Configuration

Follow a straightforward guide on configuring a LivePeer orchestrator with the main network through the [official LivePeer documentation](https://docs.livepeer.org/orchestrators/guides/get-started). Linux users can also benefit from this comprehensive [guide](https://hedgedoc.ddvtech.com/wpwHEXMFTueUM7jqhikTvw). Once configured, launch your orchestrator effortlessly using the `scripts/start_livepeer_node_template.bash` script.

> [!IMPORTANT]\
> Ensure a smooth LivePeer transcoder setup on Linux by using [CUDA 11.8](https://developer.nvidia.com/cuda-11-8-0-download-archive). The current version of [livepeer-go](https://github.com/livepeer/go-livepeer) doesn't yet support [CUDA 12.x](https://developer.nvidia.com/cuda-downloads). Follow the CUDA 11.8 installation steps outlined [here](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html). Also, confirm that you are using the GPU version of the [livepeer-go](https://github.com/livepeer/go-livepeer) binary.

### Docker Setup

Explore the simplicity of running your LivePeer orchestrator with the included [livepeer docker-compose file](livepeer/docker-compose.yml). Dive into detailed instructions by checking out the [livepeer/README](livepeer/README.md). Transcoding has never been this easy!
