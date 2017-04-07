pipeline {
    agent any
    stages {
        stage('Test') {
            steps {
	            sh 'make deps'
	            sh 'make test_with_cov'
        	}
        }
    }
}