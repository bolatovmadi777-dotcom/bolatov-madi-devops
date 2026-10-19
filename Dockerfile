# Base image: small Linux
FROM alpine:3.20

# Working directory inside the container
WORKDIR /app

# Copy the application from the project into the image
COPY app/app.sh /app/app.sh

# Make the script executable (runs at build time)
RUN chmod +x /app/app.sh

# Documented port (informational only)
EXPOSE 8080

# Command executed when the container starts
CMD ["/app/app.sh"]
