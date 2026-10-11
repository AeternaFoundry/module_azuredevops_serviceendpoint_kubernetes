variable "serviceendpoint_kubernetes" {
  description = <<EOT
Map of serviceendpoint_kubernetes, attributes below
Required:
    - apiserver_url
    - authorization_type
    - project_id
    - service_endpoint_name
Optional:
    - description
    - azure_subscription (block):
        - azure_environment (optional)
        - cluster_admin (optional)
        - cluster_name (required)
        - namespace (optional)
        - resourcegroup_id (required)
        - subscription_id (required)
        - subscription_name (required)
        - tenant_id (required)
    - kubeconfig (block):
        - accept_untrusted_certs (optional)
        - cluster_context (optional)
        - kube_config (required)
    - service_account (block):
        - accept_untrusted_certs (optional)
        - ca_cert (required)
        - token (required)
    - timeouts (block):
        - create (optional)
        - delete (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    apiserver_url         = string
    authorization_type    = string
    project_id            = string
    service_endpoint_name = string
    description           = optional(string)
    azure_subscription = optional(list(object({
      azure_environment = optional(string)
      cluster_admin     = optional(bool)
      cluster_name      = string
      namespace         = optional(string)
      resourcegroup_id  = string
      subscription_id   = string
      subscription_name = string
      tenant_id         = string
    })))
    kubeconfig = optional(object({
      accept_untrusted_certs = optional(bool)
      cluster_context        = optional(string)
      kube_config            = string
    }))
    service_account = optional(object({
      accept_untrusted_certs = optional(bool)
      ca_cert                = string
      token                  = string
    }))
    timeouts = optional(object({
      create = optional(string)
      delete = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_kubernetes : (
        contains(["AzureSubscription", "Kubeconfig", "ServiceAccount"], v.authorization_type)
      )
    ])
    error_message = "must be one of: \"AzureSubscription\", \"Kubeconfig\", \"ServiceAccount\""
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_kubernetes : (
        v.azure_subscription == null || alltrue([for item in v.azure_subscription : (item.azure_environment == null || (contains(["AzureCloud"], item.azure_environment)))])
      )
    ])
    error_message = "must be one of: \"AzureCloud\""
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_kubernetes : (
        v.azure_subscription == null || alltrue([for item in v.azure_subscription : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.subscription_id)))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_kubernetes : (
        v.azure_subscription == null || alltrue([for item in v.azure_subscription : (can(regex("^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$", item.tenant_id)))])
      )
    ])
    error_message = "must be a valid UUID"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_kubernetes : (
        v.service_account == null || (length(v.service_account.ca_cert) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.serviceendpoint_kubernetes : (
        v.service_account == null || (length(v.service_account.token) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  # Note: 1 additional provider-side validator is enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

