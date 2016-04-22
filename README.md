## SMT Solvers Dockerfile

This repository contains the **Dockerfile** of [Z3](https://github.com/Z3Prover/z3) and [CVC4](https://github.com/CVC4/CVC4) for [Docker](https://www.docker.com/)'s [automated build](https://hub.docker.com/r/aggelgian/smt-solvers/) published to the public [Docker Hub Registry](https://hub.docker.com/).

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://hub.docker.com/r/aggelgian/smt-solvers/) from public [Docker Hub Registry](https://hub.docker.com/): `docker pull aggelgian/smt-solvers`

   (alternatively, you can build an image from Dockerfile: `docker build -t="aggelgian/smt-solvers" github.com/aggelgian/smt-solvers`)

### Usage for Z3

    docker run -i --rm aggelgian/smt-solvers z3 -in < /path/to/script

### Usage for CVC4

    docker run -i --rm aggelgian/smt-solvers cvc4 --lang smt < /path/to/script
