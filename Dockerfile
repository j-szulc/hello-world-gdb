FROM debian:latest

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        gcc gdb gdbserver libc6-dev python3-pip tmux && \
    rm -r /var/lib/apt/lists/*

RUN pip install gdbfrontend

EXPOSE 5550

ENTRYPOINT tmux new gdbfrontend --listen="0.0.0.0"