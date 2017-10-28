require "administrate/base_dashboard"

class ApartmentDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    management: Field::BelongsTo,
    floorplans: Field::HasMany,
    apartment_locations: Field::HasMany,
    locations: Field::HasMany,
    apartment_amenities: Field::HasMany,
    amenities: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    email: Field::String,
    description: Field::Text,
    url: Field::String,
    phone: Field::String,
    office_hours: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    management
    floorplans
    apartment_locations
    locations
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    management
    floorplans
    apartment_locations
    locations
    apartment_amenities
    amenities
    id
    name
    email
    description
    url
    phone
    office_hours
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    management
    floorplans
    apartment_locations
    locations
    apartment_amenities
    amenities
    name
    email
    description
    url
    phone
    office_hours
  ].freeze

  # Overwrite this method to customize how apartments are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(apartment)
  #   "Apartment ##{apartment.id}"
  # end
end
