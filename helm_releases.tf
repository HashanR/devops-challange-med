# Install NGINX Ingress Controller using Helm
resource "helm_release" "nginx_ingress" {
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"  
  chart      = "ingress-nginx"
  version    = "4.12.0" 
  namespace  = "ingress-nginx"  

  # Create the namespace if it doesn't exist
  set {
    name  = "controller.createNamespace"
    value = "true"
  }

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }


  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"  
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-internal"
    value = "false" 
  }


  set {
    name  = "controller.metrics.enabled"
    value = "true"
  }


  set {
    name  = "controller.resources.requests.cpu"
    value = "100m"
  }

  set {
    name  = "controller.resources.requests.memory"
    value = "128Mi"
  }

  set {
    name  = "controller.resources.limits.cpu"
    value = "500m"
  }

  set {
    name  = "controller.resources.limits.memory"
    value = "512Mi"
  }

  wait = true
}