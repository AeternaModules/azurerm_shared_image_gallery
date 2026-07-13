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
  # --- Unconfirmed validation candidates, derived from azurerm_shared_image_gallery's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from validate.SharedImageGalleryName] !r.MatchString(value)
  # path: name
  #   source:    [from validate.SharedImageGalleryName] length > 80
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: sharing.permission
  #   source:    validation.StringInSlice value list is not a literal []string - likely a generated PossibleValuesFor*() helper; resolve separately
  # path: sharing.community_gallery.eula
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sharing.community_gallery.prefix
  #   source:    [from validate.SharedImageGalleryPrefix] !regexp.MustCompile("^[A-Za-z0-9]{5,16}$").MatchString(value)
  # path: sharing.community_gallery.publisher_email
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: sharing.community_gallery.publisher_uri
  #   condition: length(value) > 0
  #   message:   must not be empty
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

