FROM docker.io/google/dart:latest

WORKDIR /app

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y dart

# Copy your application code
COPY . .

# Run pub get to fetch dependencies
RUN pub get

CMD ["dart", "main.dart"]
