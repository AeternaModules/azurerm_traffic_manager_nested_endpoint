variable "traffic_manager_nested_endpoints" {
  description = <<EOT
Map of traffic_manager_nested_endpoints, attributes below
Required:
    - minimum_child_endpoints
    - name
    - profile_id
    - target_resource_id
Optional:
    - enabled
    - endpoint_location
    - geo_mappings
    - minimum_required_child_endpoints_ipv4
    - minimum_required_child_endpoints_ipv6
    - priority
    - weight
    - custom_header (block):
        - name (required)
        - value (required)
    - subnet (block):
        - first (required)
        - last (optional)
        - scope (optional)
EOT

  type = map(object({
    minimum_child_endpoints               = number
    name                                  = string
    profile_id                            = string
    target_resource_id                    = string
    enabled                               = optional(bool)
    endpoint_location                     = optional(string)
    geo_mappings                          = optional(list(string))
    minimum_required_child_endpoints_ipv4 = optional(number)
    minimum_required_child_endpoints_ipv6 = optional(number)
    priority                              = optional(number)
    weight                                = optional(number)
    custom_header = optional(list(object({
      name  = string
      value = string
    })))
    subnet = optional(list(object({
      first = string
      last  = optional(string)
      scope = optional(number)
    })))
  }))
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_nested_endpoints : (
        length(v.name) > 0
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_nested_endpoints : (
        v.weight == null || (v.weight >= 1 && v.weight <= 1000)
      )
    ])
    error_message = "must be between 1 and 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_nested_endpoints : (
        v.minimum_child_endpoints >= 1
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_nested_endpoints : (
        v.priority == null || (v.priority >= 1 && v.priority <= 1000)
      )
    ])
    error_message = "must be between 1 and 1000"
  }
  validation {
    condition = alltrue([
      for k, v in var.traffic_manager_nested_endpoints : (
        v.subnet == null || alltrue([for item in v.subnet : (item.scope == null || (item.scope >= 0 && item.scope <= 32))])
      )
    ])
    error_message = "must be between 0 and 32"
  }
  # Note: 10 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

