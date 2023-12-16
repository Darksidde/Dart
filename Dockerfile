FROM google/dart

WORKDIR /app

COPY . .

RUN apt-get update && \
    apt-get install -y apt-transport-https && \
    apt-get update && \
    apt-get install -y dart

RUN pub get

CMD ["dart", "main.dart"]
