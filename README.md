
## Add the repo

```
helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets
```

## Install

```bash
terraform apply
```

## Check more details

```bash
helm status sealed-secrets -n kube-system
```

## Problems

**no endpoints available for service \"http:sealed-secrets:\**

The ports section on svc need to be exacly as below:

```yaml
  ports:
  - port: 8080
    protocol: TCP
    targetPort: 8080
```

Edit the service using the command:

```bash
kubectl edit svc sealed-secrets -n kube-system
```

Based on this workaround: https://github.com/bitnami-labs/sealed-secrets/issues/694#issuecomment-997370679

## Example

Get the public certificate and save it on your machine

```bash
kubeseal --controller-name=sealed-secrets --controller-namespace=kube-system --fetch-cert cert.pem
```

Seal a secret that you want, for example secret.yaml

```bash
kubeseal --format=yaml --cert=cert.pem < secret.yaml > sealed-secret.yaml
```

Apply the sealed secret to your cluster

```bash
kubeclt apply -f sealed-secret.yaml
```

## References

- https://foxutech.medium.com/bitnami-sealed-secrets-kubernetes-secret-management-86c746ef0a79
