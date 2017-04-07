pipeline {
    agent any
    stages {
    	stage('Deps') {
	    	steps {
				sh 'make deps'
			}
    	}
    	stage('Linter') {
	    	steps {
				sh 'make lint || true'
			}
    	}
        stage('Test') {
            steps {
	            sh 'make test_with_cov'
        	}
        }
    }
}