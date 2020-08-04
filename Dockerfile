#FROM debian:buster-slim
FROM julia:1.5
#RUN set -eux; \
#   apt-get update; \
# apt-get install -y --no-install-recommends \
#  openscad \
# ; \
# rm -rf /var/lib/apt/lists/*
COPY . /Flutes.jl
RUN cd /Flutes.jl; julia -e 'using Pkg; Pkg.activate("."); Pkg.update()'
CMD ["julia"]
