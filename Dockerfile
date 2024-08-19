FROM swift:5.10.1-noble AS generator
WORKDIR /generator

# Install make, curl, and git
RUN apt-get update && apt-get install -y \
    make \
    curl \
    git

RUN git clone https://github.com/buildertrend/CreateAPI.git
WORKDIR /generator/CreateAPI

RUN make install

COPY generate.sh /generator/generate.sh

ENTRYPOINT ["/generator/generate.sh"]