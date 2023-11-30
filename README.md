# LivePeer Transcoding and Monitoring Setup

Welcome to the core of my LivePeer setup! This repository collects Docker files, scripts, configurations, and resources that power my [LivePeer](https://livepeer.org/) transcoder. It also hosts a robust monitoring system to keep a close eye on the transcoder and overall system performance.

## Clone Instructions

This repository contains several submodules. To clone this repository and its submodules, execute the following command:

```bash
git clone --recurse-submodules git@github.com:transcodeninja/livepeer-setup.git
```

## System Snapshot

### Key Components

- **OS:** [Ubuntu 22.04](https://releases.ubuntu.com/jammy/) (Kernel version: 5.15.0-86-generic).
- **GPU:** 1x [NVIDIA GeForce GTX 1070 Ti](https://www.nvidia.com/en-us/geforce/news/nvidia-geforce-gtx-1070-ti/).
- **PSU:** [Corsair HX1200i](https://www.corsair.com/us/en/p/psu/cp-9020070-na/hxi-series-hx1200i-high-performance-atx-power-supply-1200-watt-80-plus-platinum-certified-psu-cp-9020070-na) PSU.

## System Benchmarking

Assess your system's performance using the [livepeer_bench](https://github.com/livepeer/go-livepeer/blob/master/cmd/livepeer_bench/livepeer_bench.go) tool. For effective tool utilisation, find comprehensive instructions in the [official documentation](https://docs.livepeer.org/orchestrators/guides/benchmark-transcoding).

## Transcoding Setup

Explore the `transcoding` folder to discover the details of my transcoding setup. Refer to the [transcoding README](transcoding/README.md) for a clear overview.

## Monitoring System

Navigate to the `monitoring` folder for insights into my monitoring setup. For a comprehensive guide, consult the [monitoring README](monitoring/README.md). In this LivePeer hub, transcoding and monitoring seamlessly come together!
