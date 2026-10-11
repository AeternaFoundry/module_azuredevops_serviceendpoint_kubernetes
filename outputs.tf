output "serviceendpoint_kubernetes_id" {
  description = "Map of id values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes except keys with no id are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.id if v.id != null && length(v.id) > 0 }
}
output "serviceendpoint_kubernetes_apiserver_url" {
  description = "Map of apiserver_url values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes except keys with no apiserver_url are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.apiserver_url if v.apiserver_url != null && length(v.apiserver_url) > 0 }
}
output "serviceendpoint_kubernetes_authorization" {
  description = "Map of authorization values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes except keys with no authorization are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.authorization if v.authorization != null && length(v.authorization) > 0 }
}
output "serviceendpoint_kubernetes_authorization_type" {
  description = "Map of authorization_type values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes except keys with no authorization_type are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.authorization_type if v.authorization_type != null && length(v.authorization_type) > 0 }
}
output "serviceendpoint_kubernetes_azure_subscription" {
  description = "Map of azure_subscription values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes except keys with no azure_subscription are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.azure_subscription if v.azure_subscription != null && length(v.azure_subscription) > 0 }
}
output "serviceendpoint_kubernetes_description" {
  description = "Map of description values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes except keys with no description are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.description if v.description != null && length(v.description) > 0 }
}
output "serviceendpoint_kubernetes_kubeconfig" {
  description = "Map of kubeconfig values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes except keys with no kubeconfig are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => one(v.kubeconfig) if v.kubeconfig != null && length(v.kubeconfig) > 0 }
  sensitive   = true
}
output "serviceendpoint_kubernetes_project_id" {
  description = "Map of project_id values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes except keys with no project_id are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.project_id if v.project_id != null && length(v.project_id) > 0 }
}
output "serviceendpoint_kubernetes_service_account" {
  description = "Map of service_account values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes except keys with no service_account are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => one(v.service_account) if v.service_account != null && length(v.service_account) > 0 }
  sensitive   = true
}
output "serviceendpoint_kubernetes_service_endpoint_name" {
  description = "Map of service_endpoint_name values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes except keys with no service_endpoint_name are omitted"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.service_endpoint_name if v.service_endpoint_name != null && length(v.service_endpoint_name) > 0 }
}

