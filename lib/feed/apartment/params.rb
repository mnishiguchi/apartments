# A domain representation of an apartment.
# Since each feed source has slightly different xml formats, we will preconfigure
# the key to path mapping in `config/feeds/parser/<feed-name>.yml` and do the conversion based on it.
module Feed
  class Apartment
    class Params
      def initialize(source_name, feed_apartment)
        @feed_apartment = feed_apartment
        @feed_paths = PathList.fetch_paths(source_name, :apartment)

        raise ArgumentError.new, "couldn't find feed_paths" if @feed_paths.blank?
        raise ArgumentError.new, "feed_apartment must be provided" if @feed_apartment.blank?
      end

      def value
        {
          name:       value_for(:name),
          latitude:   value_for(:latitude),
          longitude:  value_for(:longitude),
          street:     value_for(:street),
          city:       value_for(:city),
          state:      value_for(:state),
          zip_code:   value_for(:zip_code),
          # floorplans: value_for(:floorplans),
        }
      end

      private

      # Get a value for the specified attribute from the feed.
      def value_for(attr)
        PathResolver.call(@feed_apartment, @feed_paths.fetch(attr))
      end
    end
  end
end
