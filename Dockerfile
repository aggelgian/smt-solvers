#
# SMT Solvers Dockerfile
#
# https://github.com/aggelgian/smt-solvers
#

# Select OS.
FROM debian:jessie

# Working directory for the solvers' installations.
WORKDIR /opt

RUN apt-get update && apt-get install -y --no-install-recommends \
  arj unzip make g++ wget python \
  && wget --no-check-certificate https://github.com/Z3Prover/z3/archive/z3-4.4.1.zip \
  && unzip z3-4.4.1.zip \
  && rm z3-4.4.1.zip \
  && wget http://cvc4.cs.nyu.edu/builds/x86_64-linux-opt/unstable/cvc4-2016-04-20-x86_64-linux-opt \
  && mv cvc4-2016-04-20-x86_64-linux-opt /usr/bin/cvc4 \
  && chmod +x /usr/bin/cvc4 \
  && apt-get remove -y wget unzip \
  && rm -rf /var/lib/apt/lists/*

# Install Z3.
RUN cd z3-z3-4.4.1 \
  && python scripts/mk_make.py \
  && cd build \
  && make -j 4 \
  && make install

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]
