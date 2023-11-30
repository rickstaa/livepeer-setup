# Transcoding

Welcome to the heart of the [Transcode.ninja](https://transcode.ninja) LivePeer transcoding setup! We have fine-tuned this toolkit to connect our LivePeer transcoder/orchestrator to various pools and the main network easily, ensuring optimal performance across different networks.

## Supported Pools

- [LivePool](https://www.livepool.io/) (public pool)
- [TitanNode](https://titan-node.com/) (public pool)
- [video-miner](https://www.video-miner.com/) (private pool)
- [LivePeer.org](https://livepeer.org/) (main network)

### Pool Setup

To connect to the pools above, please check the pool-specific setup instructions on the respective pools' websites or explore the [pools/README.md](pools/README.md).

## Orchestrator Setup

### Local Machine Configuration

To configure the LivePeer orchestrator with the main network, follow the straightforward guide in the [official LivePeer documentation](https://docs.livepeer.org/orchestrators/guides/get-started). Linux users can also benefit from this comprehensive [guide](https://hedgedoc.ddvtech.com/wpwHEXMFTueUM7jqhikTvw). Once configured, launch your orchestrator effortlessly using the `scripts/start_livepeer_node_template.bash` script.

> [!IMPORTANT]\
> To ensure a smooth LivePeer transcoding on Linux, ensure you use [CUDA 11.8](https://developer.nvidia.com/cuda-11-8-0-download-archive). The current version of [livepeer-go](https://github.com/livepeer/go-livepeer) doesn't yet support [CUDA 12.x](https://developer.nvidia.com/cuda-downloads). Follow the CUDA 11.8 installation steps outlined [here](https://docs.nvidia.com/cuda/cuda-installation-guide-linux/index.html). If you want to perform GPU transcoding, confirm that you are using the GPU version of the [livepeer-go](https://github.com/livepeer/go-livepeer) binary.

### Docker Setup

You can use the included [livepeer docker-compose file](livepeer/docker-compose.yml) to explore the simplicity of running your LivePeer orchestrator inside a docker container. For more information, check the instructions in the [livepeer/README](livepeer/README.md).
