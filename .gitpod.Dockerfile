FROM gitpod/workspace-full

USER gitpod

# Install Julia
RUN sudo apt-get update \
    && sudo apt-get install -y \
    build-essential \
    libatomic1 \
    python3 \
    gfortran \
    perl \
    wget \
    m4 \
    cmake \
    pkg-config \
    ca-certificates \
    curl \
    pandoc\
    && sudo rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://install.julialang.org | sh -s -- --yes --default-channel release
ENV PATH "$PATH:/home/gitpod/.juliaup/bin"
RUN juliaup list
RUN juliaup update release
RUN juliaup default release

# Download packages
ENV TEMP="/home/gitpod/.packages/"
RUN mkdir $TEMP
COPY .packages/*.toml $TEMP
RUN julia --project=$TEMP -e 'import Pkg; Pkg.instantiate(); Pkg.build();'

# add Revise to startup
RUN julia -e 'import Pkg; Pkg.add("Revise");'
RUN mkdir -p /home/gitpod/.julia/config/

COPY startup.jl /home/gitpod/.julia/config/    
# smoke test
RUN	julia --version

# install tinytex ()
RUN curl -sL "https://yihui.org/tinytex/install-bin-unix.sh" | sh
ENV PATH "$PATH:/home/gitpod/bin"
# smoke test
RUN tlmgr --version

# Install mmissing tex packages
RUN tlmgr install microtype upquote listings minted