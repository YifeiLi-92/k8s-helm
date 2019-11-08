helm del --purge dockercoins
helm install . --name dockercoins --namespace prod --set image.tag=$1