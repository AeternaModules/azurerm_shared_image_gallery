resource "azurerm_shared_image_gallery" "shared_image_gallerys" {
  for_each = var.shared_image_gallerys

  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  description         = each.value.description
  tags                = each.value.tags

  dynamic "sharing" {
    for_each = each.value.sharing != null ? [each.value.sharing] : []
    content {
      dynamic "community_gallery" {
        for_each = sharing.value.community_gallery != null ? [sharing.value.community_gallery] : []
        content {
          eula            = community_gallery.value.eula
          prefix          = community_gallery.value.prefix
          publisher_email = community_gallery.value.publisher_email
          publisher_uri   = community_gallery.value.publisher_uri
        }
      }
      permission = sharing.value.permission
    }
  }
}

