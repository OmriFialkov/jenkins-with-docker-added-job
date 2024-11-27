# Start from the official Jenkins image
FROM jenkins/jenkins:latest

# Set the working directory to /var/jenkins_home
WORKDIR /var/jenkins_home

# Copy the HelloWorldJob.tar.gz file into the image
COPY HelloWorldJob.tar.gz /tmp/HelloWorldJob.tar.gz

# Extract the job data to the appropriate directory
RUN tar -xzf /tmp/HelloWorldJob.tar.gz -C /var/jenkins_home/jobs && \
    rm /tmp/HelloWorldJob.tar.gz

# Ensure the permissions are correct
RUN chown -R jenkins:jenkins /var/jenkins_home

# Expose the port Jenkins will run on
EXPOSE 8080

# Set the default command to run Jenkins
ENTRYPOINT ["/usr/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
