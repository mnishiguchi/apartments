# A domain representation of an apartment.
# Since each feed source has slightly different xml formats, we will preconfigure
# the key to path mapping in `config/feeds/parser/<feed-name>.yml` and do the conversion based on it.
module Feed
  class Floorplan
    include ActiveModel::Model

    ATTRIBUTE_NAMES = %i[
      name
      sqft
      rent
    ].freeze

    attr_accessor(*ATTRIBUTE_NAMES)

    validates :name, presence: true
    validates :sqft, presence: true
    validates :rent, presence: true

    # http://api.rubyonrails.org/classes/ActiveModel/Model.html
    def initialize(attributes = {})
      super
    end

    # Returns a hash of all the attributes with their names as keys and the values of the attributes as values.
    def attributes
      Hash[ATTRIBUTE_NAMES.map { |x| [x, send(x)] }]
    end

    class << self
      def build(feed_apartment, _source)
        new(
          name: feed_apartment.dig(*name_path),
          sqft: feed_apartment.dig(*sqft_path),
          rent: feed_apartment.dig(*rent_path)
        )
      end

      # TODO: Load key path mapping config file instead of the below class methods.
      def feed_paths(source)
        # code
      end

      def name_path
        ["SquareFeet"]
      end

      def sqft_path
        ["SquareFeet"]
      end

      def rent_path
        ["EffectiveRent"]
      end
    end
  end
end
