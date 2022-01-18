cd celestia-app && docker build -t jbowen93/celestia-app:devnet .
cd ../celestia-node && \
    docker build -f light/Dockerfile -t jbowen93/celestia-node-light:devnet-no-sleep . && \
    docker build -f full/Dockerfile -t jbowen93/celestia-node-full:devnet-no-sleep .