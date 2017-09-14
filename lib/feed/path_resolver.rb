# Find a first resolved path and return the value at that path.
module Feed
  class PathResolver
    def self.call(feed, paths)
      raise ArgumentError.new, "feed must be a hash: #{feed}" unless feed.is_a? Hash
      raise ArgumentError.new, "paths must be an array: #{paths}" unless paths.is_a? Array

      paths.each do |path|
        value = feed.dig(*path)
        return value if value.present?
      end

      raise FailedToResolve.new, "Something went wrong"
    end

    class FailedToResolve < StandardError; end
  end
end
