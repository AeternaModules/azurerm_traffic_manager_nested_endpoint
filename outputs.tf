output "traffic_manager_nested_endpoints" {
  description = "All traffic_manager_nested_endpoint resources"
  value       = azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints
}
output "traffic_manager_nested_endpoints_custom_header" {
  description = "List of custom_header values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.custom_header]
}
output "traffic_manager_nested_endpoints_enabled" {
  description = "List of enabled values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.enabled]
}
output "traffic_manager_nested_endpoints_endpoint_location" {
  description = "List of endpoint_location values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.endpoint_location]
}
output "traffic_manager_nested_endpoints_geo_mappings" {
  description = "List of geo_mappings values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.geo_mappings]
}
output "traffic_manager_nested_endpoints_minimum_child_endpoints" {
  description = "List of minimum_child_endpoints values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.minimum_child_endpoints]
}
output "traffic_manager_nested_endpoints_minimum_required_child_endpoints_ipv4" {
  description = "List of minimum_required_child_endpoints_ipv4 values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.minimum_required_child_endpoints_ipv4]
}
output "traffic_manager_nested_endpoints_minimum_required_child_endpoints_ipv6" {
  description = "List of minimum_required_child_endpoints_ipv6 values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.minimum_required_child_endpoints_ipv6]
}
output "traffic_manager_nested_endpoints_name" {
  description = "List of name values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.name]
}
output "traffic_manager_nested_endpoints_priority" {
  description = "List of priority values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.priority]
}
output "traffic_manager_nested_endpoints_profile_id" {
  description = "List of profile_id values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.profile_id]
}
output "traffic_manager_nested_endpoints_subnet" {
  description = "List of subnet values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.subnet]
}
output "traffic_manager_nested_endpoints_target_resource_id" {
  description = "List of target_resource_id values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.target_resource_id]
}
output "traffic_manager_nested_endpoints_weight" {
  description = "List of weight values across all traffic_manager_nested_endpoints"
  value       = [for k, v in azurerm_traffic_manager_nested_endpoint.traffic_manager_nested_endpoints : v.weight]
}

