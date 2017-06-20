namespace :db do
  desc "Seed feed xml files to feeds table"
  task seed_feeds: :environment do
    # Specify the path to the xml files
    src_dir   = Rails.root.join("db", "feeds").to_s
    src_files = Dir.glob("#{src_dir}/*.xml")

    # Create a feed record for each file
    src_files.each do |src_file|
      puts "Loading #{src_file}"
      feed = File.read(src_file)
      json = Hash.from_xml(feed)
      Feed.create!(json: json)
    end

    puts "Done"
  end
end
