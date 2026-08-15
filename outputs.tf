output "shared_image_galleries_id" {
  description = "Map of id values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.id if v.id != null && length(v.id) > 0 }
}
output "shared_image_galleries_description" {
  description = "Map of description values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.description if v.description != null && length(v.description) > 0 }
}
output "shared_image_galleries_location" {
  description = "Map of location values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.location if v.location != null && length(v.location) > 0 }
}
output "shared_image_galleries_name" {
  description = "Map of name values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.name if v.name != null && length(v.name) > 0 }
}
output "shared_image_galleries_resource_group_name" {
  description = "Map of resource_group_name values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "shared_image_galleries_sharing" {
  description = "Map of sharing values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => one(v.sharing) if v.sharing != null && length(v.sharing) > 0 }
}
output "shared_image_galleries_tags" {
  description = "Map of tags values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "shared_image_galleries_unique_name" {
  description = "Map of unique_name values across all shared_image_galleries, keyed the same as var.shared_image_galleries"
  value       = { for k, v in azurerm_shared_image_gallery.shared_image_galleries : k => v.unique_name if v.unique_name != null && length(v.unique_name) > 0 }
}

