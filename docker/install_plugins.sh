#!/bin/bash

for plugin in sonar ssh analysis-core copyartifact email-ext emailext-template external-monitor-job gradle htmlpublisher javadoc job-import-plugin junit mailer monitoring postbuild-task saferestart build-pipeline-plugin delivery-pipeline-plugin promoted-builds  promoted-builds-simple  backup ci-skip jquery parameterized-trigger git github github-api multiple-scms token-macro scm-api matrix-project ssh-credentials credentials conditional-buildstep rebuild jobConfigHistory ansicolor
do   
  java -jar jenkins_cli.jar -s http://172.17.0.3:8080/ install-plugin $plugin
done 
