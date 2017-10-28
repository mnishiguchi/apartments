require "administrate/base_dashboard"

class ManagementDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    apartments: Field::HasMany,
    management_locations: Field::HasMany,
    locations: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    email: Field::String,
    identifier: Field::String,
    url: Field::String,
    description: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    apartments
    management_locations
    locations
    id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    apartments
    management_locations
    locations
    id
    name
    email
    identifier
    url
    description
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    apartments
    management_locations
    locations
    name
    email
    identifier
    url
    description
  ].freeze

  # Overwrite this method to customize how managements are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(management)
  #   "Management ##{management.id}"
  # end
end
