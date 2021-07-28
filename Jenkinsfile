pipeline {
   agent any
    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh './gradlew assemble'
            }
        }
        stage('Archive'){
            steps{
                echo 'Archivando..'
                archiveArtifacts artifacts: 'build/libs/*.jar'
            }
        }
       stage('Deploying'){
                   steps{
                       echo 'Se ha archivado el artefacto, desplegando ..'
                       sh 'java -jar build/libs/helo-spring-0.0.1-SNAPSHOT.jar'
                   }
               }

    }
}