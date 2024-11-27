FROM jenkins/jenkins:latest

# Switch to root to install dependencies and modify directories
USER root

# Create the necessary directories
RUN mkdir -p /var/jenkins_home/jobs

# Copy the job tar file into the image
COPY HelloWorldJob.tar.gz /tmp/

# Extract the job and ensure the correct permissions
RUN tar -xzf /tmp/HelloWorldJob.tar.gz -C /var/jenkins_home/jobs && \
    rm /tmp/HelloWorldJob.tar.gz && \
    chown -R jenkins:jenkins /var/jenkins_home

# Switch back to Jenkins user to run Jenkins
USER jenkins

# Expose Jenkins ports
EXPOSE 8080 50000

# Run Jenkins
ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
