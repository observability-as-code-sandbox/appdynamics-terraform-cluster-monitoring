kubectl create ns dev

kubectl create sa appd-account

kubectl apply -f ./application-examples/. -n dev

kubectl delete -f ./application-examples/. -n dev