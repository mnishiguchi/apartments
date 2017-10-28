require "administrate/base_dashboard"

class LocationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    apartment_locations: Field::HasMany,
    apartments: Field::HasMany,
    management_locations: Field::HasMany,
    managements: Field::HasMany,
    id: Field::Number,
    latitude: Field::String.with_options(searchable: false),
    longitude: Field::String.with_options(searchable: false),
    address_1: Field::String,
    address_2: Field::String,
    county: Field::String,
    city: Field::String,
    state: Field::String,
    neighbourhood: Field::String,
    postal_code: Field::String,
    country: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    apartment_locations
    apartments
    management_locations
    managements
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    apartment_locations
    apartments
    management_locations
    managements
    id
    latitude
    longitude
    address_1
    address_2
    county
    city
    state
    neighbourhood
    postal_code
    country
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    apartment_locations
    apartments
    management_locations
    managements
    latitude
    longitude
    address_1
    address_2
    county
    city
    state
    neighbourhood
    postal_code
    country
  ].freeze

  # Overwrite this method to customize how locations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(location)
  #   "Location ##{location.id}"
  # end
end
