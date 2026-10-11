resource "azuredevops_serviceendpoint_kubernetes" "serviceendpoint_kubernetes" {
  for_each = var.serviceendpoint_kubernetes

  apiserver_url         = each.value.apiserver_url
  authorization_type    = each.value.authorization_type
  project_id            = each.value.project_id
  service_endpoint_name = each.value.service_endpoint_name
  description           = each.value.description

  dynamic "azure_subscription" {
    for_each = each.value.azure_subscription != null ? each.value.azure_subscription : []
    content {
      azure_environment = azure_subscription.value.azure_environment
      cluster_admin     = azure_subscription.value.cluster_admin
      cluster_name      = azure_subscription.value.cluster_name
      namespace         = azure_subscription.value.namespace
      resourcegroup_id  = azure_subscription.value.resourcegroup_id
      subscription_id   = azure_subscription.value.subscription_id
      subscription_name = azure_subscription.value.subscription_name
      tenant_id         = azure_subscription.value.tenant_id
    }
  }

  dynamic "kubeconfig" {
    for_each = each.value.kubeconfig != null ? [each.value.kubeconfig] : []
    content {
      accept_untrusted_certs = kubeconfig.value.accept_untrusted_certs
      cluster_context        = kubeconfig.value.cluster_context
      kube_config            = kubeconfig.value.kube_config
    }
  }

  dynamic "service_account" {
    for_each = each.value.service_account != null ? [each.value.service_account] : []
    content {
      accept_untrusted_certs = service_account.value.accept_untrusted_certs
      ca_cert                = service_account.value.ca_cert
      token                  = service_account.value.token
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

