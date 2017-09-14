# 1. Load xml feeds from preconfigured feed sources
# 2. Process feeds (optional: in a block)
# 3. Save feeds to timestamped dir (optional: if out_dir is specified)
module Feed
  class Importer
    SOURCE_DIR = Rails.root.join("db", "feed_sources")
    SOURCE_NAMES = YAML.load_file(Rails.root.join("config", "feed", "sources.yml")).keys

    def initialize(out_dir: nil)
      @out_dir = out_dir
      FileUtils.mkdir_p(out_dir) if @out_dir.present?
    end

    def call(source_names: SOURCE_NAMES)
      source_names.each do |source_name|
        puts source_name
        xml = load_xml_from_source(source_name)

        data = block_given? ? yield(xml) : xml

        @out_dir.blank? ? next : save_to_file(source_name, data)
      end

      true
    end

    private

    def load_xml_from_source(source_name)
      # Simulate the feed loading. Probably we will send a request to API in real life.
      IO.read("#{SOURCE_DIR}/#{source_name}.xml")
    end

    def save_to_file(source_name, data)
      IO.write("#{@out_dir}/#{source_name}.xml", data)
    end
  end
end
