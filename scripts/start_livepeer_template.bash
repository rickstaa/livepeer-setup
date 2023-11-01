livepeer_bench \
    -in bbb/source.m3u8 \
    -transcodingOptions transcodingOptions.json \
    -nvidia <NVIDIA_GPU_IDs> # Only required for transcoding with GPUs
    -concurrentSessions <CONCURRENT_SESSIONS>
