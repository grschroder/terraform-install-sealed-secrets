resource "helm_release" "sealed-secret-installation" {
  name       = "sealed-secrets"
  namespace  = "kube-system"  
  repository = "https://bitnami-labs.github.io/sealed-secrets"
  chart      = "sealed-secrets" 
  create_namespace = false
  
}