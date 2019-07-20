# k8s-httperf

## Description 

This reposity include the configuration to setup an Http Load Generator using Kubernetes orchestration and Httperf as main stress tool. 


## Requirement 

* Kubernetes 1.12+ 
* Kubernetes node autoscaler is recommended 

## Usage

### Kubernetes job 

````
apiVersion: batch/v1
kind: Job
metadata:
  name: httperf-bench
spec:
  parallelism: 10
  template:
    spec:
      containers:
      - name: httperf-bench
        image: cyrilbkr/httperf
        args:
        - /bin/sh
        - -c
        - httperf --server mytestserver.com --uri="/" --port 443  --num-conns 1000000 --rate 100  --timeout 1 --ssl
        resources:
          requests:
            memory: "64Mi"
            cpu: "1"
          limits:
            memory: "2Gi"
            cpu: "2"
        securityContext:
          allowPrivilegeEscalation: true
      restartPolicy: Never
````

## Docker Image

Docker image included is based on Debian Strech Slim but you're free to use your own image as long as it include Httperf. 
