FROM ubuntu:22.04

WORKDIR /data

# Create a large file (100MB)
RUN dd if=/dev/zero of=bigfile.bin bs=1M count=100

# Delete the file
RUN rm bigfile.bin

CMD ["sleep", "300"]