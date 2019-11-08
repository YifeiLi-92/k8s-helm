helm del --purge $1
helm install . --name $1 --namespace $2 --set service.name=$1 --set environment=$2 --set image.tag=$3