output "shared_image_galleries_id" {
  description = "Map of id values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.id }
}
output "shared_image_galleries_description" {
  description = "Map of description values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.description }
}
output "shared_image_galleries_location" {
  description = "Map of location values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.location }
}
output "shared_image_galleries_name" {
  description = "Map of name values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.name }
}
output "shared_image_galleries_resource_group_name" {
  description = "Map of resource_group_name values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.resource_group_name }
}
output "shared_image_galleries_sharing" {
  description = "Map of sharing values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.sharing }
}
output "shared_image_galleries_tags" {
  description = "Map of tags values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.tags }
}
output "shared_image_galleries_unique_name" {
  description = "Map of unique_name values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.unique_name }
}

