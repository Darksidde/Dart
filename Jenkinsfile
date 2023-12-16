pipeline {
    agent any

    stages {
        stage('Run Tests') {
            steps {
                script {
                    // Testlerin çalıştırılması
                    docker.image('bmi-calculator').inside {
                        sh 'pub run test' // Dart testlerini çalıştır
                    }
                }
            }
        }

        stage('Run BMI Calculator') {
            steps {
                script {
                    // Docker konteynerinde BMI hesaplayıcısını çalıştır
                    docker.image('bmi-calculator').withRun('-p 8000:8000') {
                        // Buraya Docker konteynerinde BMI hesaplayıcı uygulamasını başlatmak için gerekli komutları ekleyin
                        // Örneğin: dart main.dart
                    }
                }
            }
        }
    }
}
