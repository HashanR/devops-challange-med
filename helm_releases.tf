########################################################
#                                                      #
#                        INGRESS                       #
########################################################
resource "helm_release" "nginx_ingress" {
  
  name       = "nginx-ingress"
  repository = "https://kubernetes.github.io/ingress-nginx"  
  chart      = "ingress-nginx"
  version    = "4.12.0" 
  namespace  = "ingress-nginx" 
  create_namespace = true

  set {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"
    value = "nlb"
  }

}
########################################################
#                                                      #
#                    Kube Prom Stack                   #
########################################################
resource "helm_release" "kube_prometheus_stack" {
  name             = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  version          = "69.3.1"
  namespace        = "monitoring"
  create_namespace = true

  # Enable Grafana Ingress
  set {
    name  = "grafana.ingress.enabled"
    value = "true"
  }
  set {
    name  = "grafana.ingress.ingressClassName"
    value = "nginx"
  }
  set {
    name  = "grafana.ingress.hosts[0]"
    value = "grafana.hashanr.cloud"
  }
  set {
    name  = "grafana.ingress.paths[0]"
    value = "/"
  }
  set {
    name  = "grafana.ingress.annotations.kubernetes\\.io/ingress\\.class"
    value = "nginx"
  }

}

