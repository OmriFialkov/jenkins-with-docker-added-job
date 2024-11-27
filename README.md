
# Jenkins Docker Image with Pre-configured Job

This project provides a Jenkins Docker image that includes a pre-configured Jenkins job called `HelloWorldJob`. This allows you to quickly deploy Jenkins with the job already set up and ready to use.

## You Need:

- Docker installed on your system.
- Basic knowledge of Docker and Jenkins.

### Dockerfile Overview

This `Dockerfile` is used to build the Docker image that includes the `HelloWorldJob` Jenkins job. It copies the `.tar.gz` file into the image and extracts the job into the appropriate directory where Jenkins stores its job configurations.

## How to Build the Docker Image

1. Clone this repository to your local machine, then cd to its folder.

2. **Build the Docker image:**

   Open your terminal and run the following command in the project directory:

   ```bash
   docker build -t jenkins_with_jobs:latest .
   ```

   This command will:

   - Create a Docker image named `jenkins_with_jobs` with the `latest` tag.
   - Copy the `HelloWorldJob.tar.gz` file into the container.
   - Extract the contents of `HelloWorldJob.tar.gz` into the `/var/jenkins_home/jobs/` directory.

## How to Run the Jenkins Container

1. **Run the Docker container:**

   Once the image is built, you can run the container using the following command:

   ```bash
   docker run -d -p 8080:8080 jenkins_with_jobs:latest
   ```

   This will:

   - Start the Jenkins container in detached mode (`-d`).
   - Expose Jenkins on port 8080 (`-p 8080:8080`).

2. **Access Jenkins in your web browser:**

   Open your browser and navigate to [http://localhost:8080](http://localhost:8080).

3. **Retrieve the initial admin password:**

   To log into Jenkins for the first time, you will need the initial admin password. Run the following command to get the password:

   ```bash
   docker exec -it <container_id> cat /var/jenkins_home/secrets/initialAdminPassword
   ```

   Replace `<container_id>` with the actual container ID of your running Jenkins container. You can find the container ID by running:

   ```bash
   docker ps
   ```

4. **Log in to Jenkins:**

   - Open [http://localhost:8080](http://localhost:8080) in your browser.
   - Enter the password you retrieved earlier, username is admin.
   - Proceed with the setup wizard to complete the Jenkins installation.

The `HelloWorldJob` should now be available and ready to be used. You can configure it or trigger a build as you would with any Jenkins job.

## Additional Notes

- The `HelloWorldJob` is extracted from the `HelloWorldJob.tar.gz` archive that you included in the build.
- If you wish to add more jobs, simply place them in the `jobs/` directory of the `.tar.gz` file and rebuild the Docker image.

