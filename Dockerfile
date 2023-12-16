FROM google/dart

WORKDIR /app

COPY . .

RUN pub get

CMD ["dart", "main.dart"]
