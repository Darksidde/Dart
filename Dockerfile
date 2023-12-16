FROM docker.io/google/dart:latest


# Gerekli bağımlılıkları yükle
RUN apt-get update && apt-get install -y apt-transport-https && apt-get update && apt-get install -y unzip

# Dart SDK'nın PATH'e eklenmesi
ENV PATH="$PATH:/usr/lib/dart/bin"

WORKDIR /app

COPY . .

# Pub get komutunun çalıştırılması
RUN pub get

CMD ["dart", "main.dart"]
