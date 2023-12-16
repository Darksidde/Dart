# Gerekli araçları ekleyebilen ve paket kurulumu için destek sağlayabilen uygun bir temel imaj kullanın
FROM debian:bullseye

# Gerekli araçları (wget) yükleyin ve Dart deposunu ekleyin
RUN apt-get update && \
    apt-get install -y apt-transport-https wget gnupg && \
    wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    echo "deb https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" | tee /etc/apt/sources.list.d/dart.list && \
    apt-get update

# Dart SDK 2.17 sürümünü kurun
RUN apt-get install -y dart=2.17.*

# Dart'ı PATH'e ekleyin
ENV PATH="/usr/lib/dart/bin:${PATH}"

# Uygulamanız için çalışma dizinini belirleyin
WORKDIR /app

# Uygulama kodunuzu kopyalayın
COPY . .

# Bağımlılıkları yüklemek için alternatif bir yöntem kullanma
# Örnek olarak:
# RUN dart pubspec.yaml get
# Yukarıdaki komut, dart CLI aracı ile bağımlılıkları yükler

# Dart uygulamanızı çalıştırmak için komutu tanımlayın
CMD ["dart", "main.dart"]
