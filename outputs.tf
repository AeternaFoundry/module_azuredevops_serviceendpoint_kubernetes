output "serviceendpoint_kubernetes_id" {
  description = "Map of id values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.id }
}
output "serviceendpoint_kubernetes_apiserver_url" {
  description = "Map of apiserver_url values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.apiserver_url }
}
output "serviceendpoint_kubernetes_authorization" {
  description = "Map of authorization values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.authorization }
}
output "serviceendpoint_kubernetes_authorization_type" {
  description = "Map of authorization_type values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.authorization_type }
}
output "serviceendpoint_kubernetes_azure_subscription" {
  description = "Map of azure_subscription values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.azure_subscription }
}
output "serviceendpoint_kubernetes_description" {
  description = "Map of description values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.description }
}
output "serviceendpoint_kubernetes_kubeconfig" {
  description = "Map of kubeconfig values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => one(v.kubeconfig) }
  sensitive   = true
}
output "serviceendpoint_kubernetes_project_id" {
  description = "Map of project_id values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.project_id }
}
output "serviceendpoint_kubernetes_service_account" {
  description = "Map of service_account values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => one(v.service_account) }
  sensitive   = true
}
output "serviceendpoint_kubernetes_service_endpoint_name" {
  description = "Map of service_endpoint_name values across all serviceendpoint_kubernetes, keyed the same as var.serviceendpoint_kubernetes"
  value       = { for k, v in azuredevops_serviceendpoint_kubernetes.serviceendpoint_kubernetes : k => v.service_endpoint_name }
}

