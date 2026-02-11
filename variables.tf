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
}

