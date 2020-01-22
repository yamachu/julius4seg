FROM ubuntu:18.04

# For supporting Japanese in Python3
ENV LC_CTYPE=C.UTF-8

# Install git, git-lfs and Julius dependencies
RUN apt-get update && \
    apt-get install -y curl git python3 libgomp1 pulseaudio && \
    apt-get clean && \
    curl -sLO https://github.com/git-lfs/git-lfs/releases/download/v2.10.0/git-lfs-linux-amd64-v2.10.0.tar.gz && \
    tar -zxf git-lfs-linux-amd64-v2.10.0.tar.gz git-lfs && \
    mv git-lfs /usr/bin/ && \
    rm git-lfs-linux-amd64-v2.10.0.tar.gz && \
    git lfs install --skip-smudge

ARG DICTATION_KIT_HASH="1ceb4dec245ef482918ca33c55c71d383dce145e"
RUN git clone https://github.com/julius-speech/dictation-kit.git /opt/dictation-kit && \
    cd /opt/dictation-kit && \
    git checkout ${DICTATION_KIT_HASH} && \
    git lfs fetch origin --recent -I "model/phone_m/jnas-mono-16mix-gid*" && \
    git lfs checkout origin "model/phone_m/jnas-mono-16mix-gid*"

ARG JULIUS4SEG_HASH="d83a954489d4d8ba605982355f6d95724a8121df"
RUN git clone https://github.com/yamachu/julius4seg.git /opt/julius4seg && \
    cd /opt/julius4seg && \
    git checkout ${JULIUS4SEG_HASH} && \
    cd /opt/julius4seg/sample && \
    chmod +x ./run.sh

WORKDIR /opt/julius4seg/sample

ENTRYPOINT ["./run.sh"]
