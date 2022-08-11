FROM perftool/bcc:compile AS build

FROM perftool/base:python

COPY --from=build /usr/share/bcc/ /opt/perf/bcc
COPY --from=build /usr/lib/python3/dist-packages/ /usr/lib/python3/dist-packages
COPY --from=build /usr/lib/x86_64-linux-gnu/libbcc-loader-static.a /usr/lib/x86_64-linux-gnu/libbcc-loader-static.a
COPY --from=build /usr/lib/x86_64-linux-gnu/libbcc.a /usr/lib/x86_64-linux-gnu/libbcc.a
COPY --from=build /usr/lib/x86_64-linux-gnu/libbcc.so /usr/lib/x86_64-linux-gnu/libbcc.so
COPY --from=build /usr/lib/x86_64-linux-gnu/libbcc.so.0 /usr/lib/x86_64-linux-gnu/libbcc.so.0
COPY --from=build /usr/lib/x86_64-linux-gnu/libbcc.so.0.25.0 /usr/lib/x86_64-linux-gnu/libbcc.so.0.25.0
COPY --from=build /usr/lib/x86_64-linux-gnu/libbcc_bpf.a /usr/lib/x86_64-linux-gnu/libbcc_bpf.a
COPY --from=build /usr/lib/x86_64-linux-gnu/libbcc_bpf.so /usr/lib/x86_64-linux-gnu/libbcc_bpf.so
COPY --from=build /usr/lib/x86_64-linux-gnu/libbcc_bpf.so.0 /usr/lib/x86_64-linux-gnu/libbcc_bpf.so.0
COPY --from=build /usr/lib/x86_64-linux-gnu/libbcc_bpf.so.0.25.0 /usr/lib/x86_64-linux-gnu/libbcc_bpf.so.0.25.0
COPY --from=build /usr/lib/x86_64-linux-gnu/libelf-0.186.so /usr/lib/x86_64-linux-gnu/libelf-0.186.so
COPY --from=build /usr/lib/x86_64-linux-gnu/libelf.a /usr/lib/x86_64-linux-gnu/libelf.a
COPY --from=build /usr/lib/x86_64-linux-gnu/libelf.so /usr/lib/x86_64-linux-gnu/libelf.so
COPY --from=build /usr/lib/x86_64-linux-gnu/libelf.so.1 /usr/lib/x86_64-linux-gnu/libelf.so.1

RUN apt-get update && \
    apt-get install -y strace bpftrace && \
    apt-get clean all

WORKDIR /opt/perf
