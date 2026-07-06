output "shared_image_galleries" {
  description = "All shared_image_gallery resources"
  value       = azurerm_shared_image_gallery.shared_image_galleries
}
output "shared_image_galleries_description" {
  description = "List of description values across all shared_image_galleries"
  value       = [for k, v in azurerm_shared_image_gallery.shared_image_galleries : v.description]
}
output "shared_image_galleries_location" {
  description = "List of location values across all shared_image_galleries"
  value       = [for k, v in azurerm_shared_image_gallery.shared_image_galleries : v.location]
}
output "shared_image_galleries_name" {
  description = "List of name values across all shared_image_galleries"
  value       = [for k, v in azurerm_shared_image_gallery.shared_image_galleries : v.name]
}
output "shared_image_galleries_resource_group_name" {
  description = "List of resource_group_name values across all shared_image_galleries"
  value       = [for k, v in azurerm_shared_image_gallery.shared_image_galleries : v.resource_group_name]
}
output "shared_image_galleries_sharing" {
  description = "List of sharing values across all shared_image_galleries"
  value       = [for k, v in azurerm_shared_image_gallery.shared_image_galleries : v.sharing]
}
output "shared_image_galleries_tags" {
  description = "List of tags values across all shared_image_galleries"
  value       = [for k, v in azurerm_shared_image_gallery.shared_image_galleries : v.tags]
}
output "shared_image_galleries_unique_name" {
  description = "List of unique_name values across all shared_image_galleries"
  value       = [for k, v in azurerm_shared_image_gallery.shared_image_galleries : v.unique_name]
}

