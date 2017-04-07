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
                step([$class: 'XUnitBuilder',
                thresholds: [
                    [$class: 'SkippedThreshold', failureThreshold: '0'],
                    // Allow for a significant number of failures
                    // Keeping this threshold so that overwhelming failures are guaranteed
                    //     to still fail the build
                    [$class: 'FailedThreshold', failureThreshold: '10']],
tools: [[$class: 'JUnitType', pattern: 'reports/**']]])
        	}
        }
    }
}