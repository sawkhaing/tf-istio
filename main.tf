resource "helm_release" "istio_base" {
  name       = "istio-base"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"

  create_namespace = true
  timeout          = 120
  cleanup_on_fail  = true
  force_update     = false
  namespace        = "istio-system"
}

resource "helm_release" "istiod" {
  name       = "istiod"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "istiod"

  timeout         = 120
  cleanup_on_fail = true
  force_update    = false
  namespace       = "istio-system"
  depends_on = [
    helm_release.istio_base
  ]
}

resource "helm_release" "istio_ingress" {
  name       = "istio-ingress"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "gateway"

  timeout         = 500
  cleanup_on_fail = true
  force_update    = false
  namespace       = "istio-system"
  depends_on = [
    helm_release.istiod
  ]
}