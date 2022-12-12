# flink-poc

## Local Development
- Start Operator
    - `minikube start --kubernetes-version**=**v1.21.5`
    - `kubectl create -f https://github.com/jetstack/cert-manager/releases/download/v1.8.2/cert-manager.yaml`
    - `helm repo add flink-operator-repo https://downloads.apache.org/flink/flink-kubernetes-operator-1.2.0/`
    - `helm install flink-kubernetes-operator flink-operator-repo/flink-kubernetes-operator`
- Run App Locally
    - `minikube image rm flink_poc`
    - `minikube image build -t flink_poc .`
    - `kubectl create -f flink-app.yaml`
    - `kubectl logs deploy/flink-poc`
    - `kubectl port-forward svc/flink-poc-rest 8081`
    - `kubectl delete -f flink-app.yaml`