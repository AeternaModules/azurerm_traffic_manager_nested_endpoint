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
    enabled                               = optional(bool, true)
    endpoint_location                     = optional(string)
    geo_mappings                          = optional(list(string))
    minimum_required_child_endpoints_ipv4 = optional(number)
    minimum_required_child_endpoints_ipv6 = optional(number)
    priority                              = optional(number)
    weight                                = optional(number, 1)
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
}

