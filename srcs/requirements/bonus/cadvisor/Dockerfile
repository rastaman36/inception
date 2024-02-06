FROM debian:bullseye

# Install necessary dependencies
RUN apt-get update && apt-get install -y wget

# Download and install cAdvisor
RUN wget -O /usr/local/bin/cadvisor https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor && \
    chmod +x /usr/local/bin/cadvisor

# Expose the port used by cAdvisor
EXPOSE 8080

# Start cAdvisor
CMD ["/usr/local/bin/cadvisor"]