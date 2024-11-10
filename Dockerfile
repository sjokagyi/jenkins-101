# Start with the official Jenkins agent image that includes JDK17
FROM jenkins/agent:latest-jdk17

# Labels to identify the image
LABEL maintainer="sjokagyi"
LABEL description="Jenkins Agent with Python support"

# Install Python and other essential packages
USER root
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    ln -sf /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*

# Install additional Python libraries if needed
# RUN pip3 install <your-required-python-libraries>

# Switch back to Jenkins user
USER jenkins

# Define the default command
CMD ["jenkins-agent"]
