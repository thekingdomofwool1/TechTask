provider "kubernetes" {
  config_path    = "~/.kube/config"                
  config_context = "my-context"
}

provider "helm" {
  kubernetes {
    config_path    = "~/.kube/config"            
  }
}

resource "helm_release" "wiz-kubernetes-integration" {
  name       = "wiz-kubernetes-integration"

  repository = "https://wiz-sec.github.io/charts"
  chart      = "wiz-kubernetes-integration"
  values = [
    "${file("values.yaml")}"
  ]
}
