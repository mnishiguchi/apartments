module Feed
  class PathList
    include Singleton

    class << self
      # Find or load feed paths for a given feed source.
      def for_feed_source(source_name)
        instance.send(:path_from_cache, source_name) || instance.send(:load_path, source_name)
      end

      def fetch_paths(source_name, key)
        for_feed_source(source_name)[key]
      end
    end

    private

    def initialize
      @paths = {}
    end

    def path_from_cache(source_name)
      @paths[source_name]
    end

    def load_path(source_name)
      file = Rails.root.join("config", "feed", "paths", "#{source_name}.yml")
      @paths[source_name] = YAML.load_file(file)&.deep_symbolize_keys
    rescue
      raise ArgumentError.new, "Invalid source_name: #{source_name}"
    end
  end
end
