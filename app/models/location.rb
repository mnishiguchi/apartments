# == Schema Information
#
# Table name: locations
#
#  id            :integer          not null, primary key
#  layer         :string
#  latitude      :decimal(, )
#  longitude     :decimal(, )
#  address_1     :string
#  address_2     :string
#  county        :string
#  city          :string
#  state         :string
#  neighbourhood :string
#  postal_code   :string
#  country       :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Location < ApplicationRecord
  include LocationsHelper

  has_many :apartment_locations
  has_many :apartments, through: :apartment_locations

  has_many :management_locations
  has_many :managements, through: :management_locations

  # Some geocoder-provided methods:
  # - obj.within_bounding_box([38.9143795889, -77.0463151949, 38.9278925327, -77.0364987456])
  # - Location.near(obj)
  geocoded_by :geocoder_address do |obj, results|
    geo = results.first
    if geo.present?
      # https://github.com/alexreisner/geocoder#advanced-geocoding
      obj.layer = geo.layer
      obj.city = geo.city
      obj.county = geo.county
      obj.state = geo.state_code
      obj.postal_code = geo.postal_code
      obj.country = geo.country_code
      obj.latitude = geo.latitude
      obj.longitude = geo.longitude
      obj.label = geo.data.dig("properties", "label")
      obj.bbox = geo.data["bbox"]
      obj.data = geo.data

      # Mapzen uses British spelling vs Geocoder gem American.
      if geo.layer == "neighborhood"
        obj.neighbourhood = geo.data.dig("properties", "neighbourhood")
      end

      # Save location data to file system
      output_file = Rails.root.join("db/geo/#{geo.data.dig('properties', 'label').parameterize}.yaml").to_s
      IO.write(output_file, geo.data.to_yaml)
    end
  end

  before_validation :abbreviate_state, if: ->(obj) { obj.state && obj.state.length > 2 }
  before_validation :set_washington, if: ->(obj) { obj.state == "DC" && obj.city.blank? }

  validates :state, presence: true
  validate do |obj|
    # Some locations have only city; some only county.
    if obj.city.blank? && obj.county.blank?
      errors[:base] << "Please provide city or county"
    end
  end

  # Avoid unnecessary API requests to geocoding service.
  before_create :geocode, if: :should_geocode_before_create
  before_update :geocode, if: :should_geocode_before_update

  scope :neighbourhood_layer, -> { where(layer: "neighbourhood") }
  scope :address_layer, -> { where(layer: "address") }
  scope :street_layer, -> { where(layer: "street") }
  scope :locality_layer, -> { where(layer: "locality") }
  scope :county_layer, -> { where(layer: "county") }
  scope :region_layer, -> { where(layer: "region") }

  def geocoder_address
    # Too much or too little info in geocoder_address can cause wrong geocoding.
    [(neighbourhood || address_1), (county || city), state].compact.join(", ")
  end

  private

  def should_geocode_before_create
    !geocoded? && geocoder_address.present?
  end

  def should_geocode_before_update
    (address_1.present? && will_save_change_to_address_1?) || will_save_change_to_city?
  end

  def abbreviate_state
    self.state = Location::US_STATES.key(state)
  end

  def set_washington
    # When address data is not found, fallback data sometimes does not provide city (locality).
    # But it state is DC, we know the city is Washington.
    self.city = "Washington"
  end
end
