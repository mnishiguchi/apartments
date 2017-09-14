namespace :feed do
  desc "Import feed xml from all the feed sources and save to file system"
  task import: :environment do
    out_dir = Rails.root.join("db/feeds/#{Time.current.strftime('%Y%m%d%H%M%S')}").to_s
    Feed::Importer.new(out_dir: out_dir).call do |xml|
      # TODO: convert feed to domain representation
      # TODO: save the domain representation to database

      binding.pry

      xml
    end
  end
end
