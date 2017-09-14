namespace :feed do
  desc "Print all xpaths for a feed source"
  task :xpaths, [:source_name] => [:environment] do |_t, args|
    raise ArgumentError.new, "Usage: rake feed:xpaths[source_name]" if args[:source_name].blank?

    xpath_list_for_feed_source(args[:source_name]).each do |xpath|
      puts xpath
    end
  end
end

private

def xpath_list_for_feed_source(source_name)
  file = feed_files(source_name).last
  all_xpaths(parse_xml(IO.read(file)))
end

def feed_files(source_name)
  pattern = Rails.root.join("db/feeds/**/*/#{source_name}.xml")
  Dir.glob(pattern).tap do |files|
    if files.blank?
      raise ArgumentError.new, "Couldn't find a feed file for #{source_name}"
    end
  end
end

def parse_xml(xml)
  # Read xml files and parse them using Nokogiri.
  # http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html#from_a_file
  Nokogiri::XML(xml)
end

# Generates an array of all the xpath from a Nokogiri-parsed document.
# Duplicate xpaths will be removed and array indices will be replaced with `[0]`.
# http://stackoverflow.com/a/15692699/3837223
def all_xpaths(parsed_doc)
  parsed_doc.xpath("//*").map do |node|
    node.path.gsub(/\[\d*\]/, "[0]")
  end.uniq
end
