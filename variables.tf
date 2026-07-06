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
    enabled                               = optional(bool) # Default: true
    endpoint_location                     = optional(string)
    geo_mappings                          = optional(list(string))
    minimum_required_child_endpoints_ipv4 = optional(number)
    minimum_required_child_endpoints_ipv6 = optional(number)
    priority                              = optional(number)
    weight                                = optional(number) # Default: 1
    custom_header = optional(object({
      name  = string
      value = string
    }))
    subnet = optional(object({
      first = string
      last  = optional(string)
      scope = optional(number)
    }))
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
        v.subnet == null || (v.subnet.scope == null || (v.subnet.scope >= 0 && v.subnet.scope <= 32))
      )
    ])
    error_message = "must be between 0 and 32"
  }
  # --- Unconfirmed validation candidates, derived from azurerm_traffic_manager_nested_endpoint's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: profile_id
  #   source:    [from profiles.ValidateTrafficManagerProfileID] !ok
  # path: profile_id
  #   source:    [from profiles.ValidateTrafficManagerProfileID] err != nil
  # path: target_resource_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: target_resource_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: custom_header.name
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: custom_header.value
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: subnet.first
  #   source:    [from azValidate.IPv4Address] !ok
  # path: subnet.first
  #   source:    [from azValidate.IPv4Address] four == nil
  # path: subnet.last
  #   source:    [from azValidate.IPv4Address] !ok
  # path: subnet.last
  #   source:    [from azValidate.IPv4Address] four == nil
}

