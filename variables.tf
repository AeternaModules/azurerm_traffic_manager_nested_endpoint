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
  # --- Unconfirmed validation candidates, derived from azurerm_traffic_manager_nested_endpoint's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: profile_id
  #   source:    [from profiles.ValidateTrafficManagerProfileID] !ok
  # path: profile_id
  #   source:    [from profiles.ValidateTrafficManagerProfileID] err != nil
  # path: target_resource_id
  #   source:    [from azure.ValidateResourceID] !ok
  # path: target_resource_id
  #   source:    [from azure.ValidateResourceID] err != nil
  # path: weight
  #   condition: value >= 1 && value <= 1000
  #   message:   must be between 1 and 1000
  # path: minimum_child_endpoints
  #   condition: value >= 1
  #   message:   must be at least 1
  # path: custom_header.name
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: custom_header.value
  #   source:    validation.NoZeroValues(...) - no translation rule yet, add one
  # path: priority
  #   condition: value >= 1 && value <= 1000
  #   message:   must be between 1 and 1000
  # path: subnet.first
  #   source:    [from azValidate.IPv4Address] !ok
  # path: subnet.first
  #   source:    [from azValidate.IPv4Address] four == nil
  # path: subnet.last
  #   source:    [from azValidate.IPv4Address] !ok
  # path: subnet.last
  #   source:    [from azValidate.IPv4Address] four == nil
  # path: subnet.scope
  #   condition: value >= 0 && value <= 32
  #   message:   must be between 0 and 32
}

