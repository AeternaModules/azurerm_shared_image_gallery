variable "shared_image_galleries" {
  description = <<EOT
Map of shared_image_galleries, attributes below
Required:
    - location
    - name
    - resource_group_name
Optional:
    - description
    - tags
    - sharing (block):
        - community_gallery (optional, block):
            - eula (required)
            - prefix (required)
            - publisher_email (required)
            - publisher_uri (required)
        - permission (required)
EOT

  type = map(object({
    location            = string
    name                = string
    resource_group_name = string
    description         = optional(string)
    tags                = optional(map(string))
    sharing = optional(object({
      community_gallery = optional(object({
        eula            = string
        prefix          = string
        publisher_email = string
        publisher_uri   = string
      }))
      permission = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.shared_image_galleries : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.shared_image_galleries : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.shared_image_galleries : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.shared_image_galleries : (
        v.sharing == null || (v.sharing.community_gallery == null || (length(v.sharing.community_gallery.eula) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.shared_image_galleries : (
        v.sharing == null || (v.sharing.community_gallery == null || (length(v.sharing.community_gallery.publisher_email) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.shared_image_galleries : (
        v.sharing == null || (v.sharing.community_gallery == null || (length(v.sharing.community_gallery.publisher_uri) > 0))
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.shared_image_galleries : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 9 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

