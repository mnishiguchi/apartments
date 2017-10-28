require "administrate/base_dashboard"

class AmenityDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    apartment_amenities: Field::HasMany,
    apartments: Field::HasMany,
    floorplan_amenities: Field::HasMany,
    floorplans: Field::HasMany,
    id: Field::Number,
    identifier: Field::String,
    title: Field::String,
    description: Field::Text,
    tags: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    apartment_amenities
    apartments
    floorplan_amenities
    floorplans
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    apartment_amenities
    apartments
    floorplan_amenities
    floorplans
    id
    identifier
    title
    description
    tags
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    apartment_amenities
    apartments
    floorplan_amenities
    floorplans
    identifier
    title
    description
    tags
  ].freeze

  # Overwrite this method to customize how amenities are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(amenity)
  #   "Amenity ##{amenity.id}"
  # end
end
