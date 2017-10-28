require "administrate/base_dashboard"

class FloorplanDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    apartment: Field::BelongsTo,
    floorplan_amenities: Field::HasMany,
    amenities: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    identifier: Field::String,
    image_url: Field::String,
    bathroom_count: Field::String.with_options(searchable: false),
    bedroom_count: Field::String.with_options(searchable: false),
    rent_min: Field::Number,
    rent_max: Field::Number,
    sqft_min: Field::Number,
    sqft_max: Field::Number,
    unit_count_total: Field::Number,
    unit_count_available: Field::Number,
    availabitity_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    apartment
    floorplan_amenities
    amenities
    id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    apartment
    floorplan_amenities
    amenities
    id
    name
    identifier
    image_url
    bathroom_count
    bedroom_count
    rent_min
    rent_max
    sqft_min
    sqft_max
    unit_count_total
    unit_count_available
    availabitity_url
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    apartment
    floorplan_amenities
    amenities
    name
    identifier
    image_url
    bathroom_count
    bedroom_count
    rent_min
    rent_max
    sqft_min
    sqft_max
    unit_count_total
    unit_count_available
    availabitity_url
  ].freeze

  # Overwrite this method to customize how floorplans are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(floorplan)
  #   "Floorplan ##{floorplan.id}"
  # end
end
