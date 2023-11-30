# LivePeer Transcoding and Monitoring Setup

Welcome to the core of the [transcode.ninja](https://transcode.ninja) orchestrator setup! This repository collects Docker files, scripts, configurations, and resources that power the [Transcode.ninja](https://livepeer.org/) transcoder. It also hosts a robust monitoring system to monitor the transcoder and overall system performance closely.

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

You can assess your system's performance using the [livepeer_bench](https://github.com/livepeer/go-livepeer/blob/master/cmd/livepeer_bench/livepeer_bench.go) tool. For information on this tool, please check the instructions in the [official Livepeer documentation](https://docs.livepeer.org/orchestrators/guides/benchmark-transcoding).

## Transcoding Setup

You can check out the `transcoding` folder to discover the details of our transcoding setup. For more information, see the [transcoding README](transcoding/README.md).

## Monitoring System

You can check out the `monitoring` folder for insights into our monitoring system. For more information, consult the [monitoring README](monitoring/README.md).
