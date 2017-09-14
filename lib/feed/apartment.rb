# A domain representation of an apartment.
# Since each feed source has slightly different xml formats, we will preconfigure
# the key to path mapping in `config/feeds/parser/<feed-name>.yml` and do the conversion based on it.
module Feed
  class Apartment
    include ActiveModel::Model

    ATTRIBUTE_NAMES = %i[
      name
      latitude
      longitude
      street
      city
      state
      zip_code
      floorplans
    ].freeze

    attr_accessor(*ATTRIBUTE_NAMES)

    validates :name, presence: true
    validates :latitude, presence: true, numericality: true
    validates :longitude, presence: true, numericality: true
    validates :street, presence: true
    validates :city, presence: true
    validates :state, presence: true

    # http://api.rubyonrails.org/classes/ActiveModel/Model.html
    def initialize(attributes = {})
      super
    end

    # Returns a hash of all the attributes with their names as keys and the values of the attributes as values.
    def attributes
      Hash[ATTRIBUTE_NAMES.map { |x| [x, send(x)] }]
    end
  end
end
