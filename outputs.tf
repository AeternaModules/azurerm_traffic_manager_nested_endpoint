output "traffic_manager_nested_endpoints_custom_header" {
  description = "Map of custom_header values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.custom_header }
}
output "traffic_manager_nested_endpoints_enabled" {
  description = "Map of enabled values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.enabled }
}
output "traffic_manager_nested_endpoints_endpoint_location" {
  description = "Map of endpoint_location values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.endpoint_location }
}
output "traffic_manager_nested_endpoints_geo_mappings" {
  description = "Map of geo_mappings values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.geo_mappings }
}
output "traffic_manager_nested_endpoints_minimum_child_endpoints" {
  description = "Map of minimum_child_endpoints values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.minimum_child_endpoints }
}
output "traffic_manager_nested_endpoints_minimum_required_child_endpoints_ipv4" {
  description = "Map of minimum_required_child_endpoints_ipv4 values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.minimum_required_child_endpoints_ipv4 }
}
output "traffic_manager_nested_endpoints_minimum_required_child_endpoints_ipv6" {
  description = "Map of minimum_required_child_endpoints_ipv6 values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.minimum_required_child_endpoints_ipv6 }
}
output "traffic_manager_nested_endpoints_name" {
  description = "Map of name values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.name }
}
output "traffic_manager_nested_endpoints_priority" {
  description = "Map of priority values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.priority }
}
output "traffic_manager_nested_endpoints_profile_id" {
  description = "Map of profile_id values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.profile_id }
}
output "traffic_manager_nested_endpoints_subnet" {
  description = "Map of subnet values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.subnet }
}
output "traffic_manager_nested_endpoints_target_resource_id" {
  description = "Map of target_resource_id values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.target_resource_id }
}
output "traffic_manager_nested_endpoints_weight" {
  description = "Map of weight values across all traffic_manager_nested_endpoints, keyed the same as var.traffic_manager_nested_endpoints"
  value       = { for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : k => v.weight }
}

