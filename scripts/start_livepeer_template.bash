livepeer \
    -network arbitrum-one-mainnet \
    -ethUrl <ETH_URL> \
    -ethAcctAddr <ETH_ACCT_ADDR> \ # Only required if you already have an ETH account you want to use
    -orchestrator \
    -transcoder \
    -nvidia <NVIDIA_DEVICE_IDs> \ # Only required for transcoding with Nvidia GPUs
    -pricePerUnit <PRICE_PER_UNIT> \
    -serviceAddr <SERVICE_ADDR> # Hostname/IP:port
    -maxGasPrice <MAX_GAS_PRICE>
