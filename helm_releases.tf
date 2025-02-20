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
#                      Cert Manager                    #
########################################################
resource "helm_release" "cert_manager" {
  name       = "cert-manager"
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.17.0"
  namespace  = "cert-manager"
  create_namespace = true
  timeout    = 600 # 10 minutes

  set {
    name  = "installCRDs"
    value = "true"
  }

}
########################################################
#                                                      #
#                   Let's Encrypt Issuer               #
########################################################
resource "kubectl_manifest" "letsencrypt_cluster_issuer" {
  depends_on = [helm_release.cert_manager]

  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: letsencrypt-prod
spec:
  acme:
    email: rmhashan@gmail.com
    server: https://acme-v02.api.letsencrypt.org/directory
    privateKeySecretRef:
      name: letsencrypt-prod
    solvers:
    - http01:
        ingress:
          class: nginx
YAML
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
  
  set {
  name  = "grafana.ingress.tls[0].secretName"
  value = "letsencrypt-prod"
}

set {
  name  = "grafana.ingress.tls[0].hosts[0]"
  value = "grafana.hashanr.cloud"
}

}