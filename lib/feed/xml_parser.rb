# Convert an xml apartment feed to our domain representation.
module Feed
  class XmlParser
    attr_reader :feed, :source_name

    def initialize(xml:, source_name:)
      @feed = Hash.from_xml(xml)
      @source_name = source_name
    end

    # An array of Feed::Apartment objects
    def apartments
      paths = PathList.fetch_paths(@source_name, :apartments)
      PathResolver.call(@feed, paths).map do |apartment|
        build_apartment(apartment)
      end
    end

    def managements
      paths = PathList.fetch_paths(@source_name, :apartments)
      PathResolver.call(@feed, paths)
    end

    private

    def build_apartment(feed_apartment)
      params = Apartment::Params.new(@source_name, feed_apartment)
      Apartment.new(params.value)
    end
  end
end
