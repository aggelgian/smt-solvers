#
# SMT Solvers Dockerfile
#
# https://github.com/aggelgian/smt-solvers
#

# Select OS.
FROM debian:jessie

# Install dependencies.
RUN apt-get update && apt-get install -y \
  arj \
  make \
  autoconf \
  libtool \
  gcc \
  g++ \
  libgmp-dev \
  libboost-dev \
  libboost-all-dev \
  libboost-test-dev \
  wget \
  git \
  python \
  default-jdk \
  swig \
  && rm -rf /var/lib/apt/lists/*

# Working directory for the solvers' installations.
WORKDIR /opt

# Install Z3.
RUN git clone --branch=z3-4.4.1 --depth=1 https://github.com/Z3Prover/z3.git
RUN cd z3 \
  && python scripts/mk_make.py \
  && cd build \
  && make -j 4 \
  && make install

# Install CVC4.
RUN git clone --depth=1 https://github.com/CVC4/CVC4.git
RUN chmod -R +x CVC4/ \
  && cd CVC4 \
  && ./contrib/get-antlr-3.4 \
  && ./autogen.sh \
  && ./configure --with-antlr-dir=/opt/CVC4/antlr-3.4 ANTLR=/opt/CVC4/antlr-3.4/bin/antlr3 \
  && make -j 4 \
  && make install

RUN ln -s /usr/local/lib/libcvc4parser.so.3 /usr/lib/libcvc4parser.so.3 \
  && ln -s /usr/local/lib/libcvc4.so.3 /usr/lib/libcvc4.so.3

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
