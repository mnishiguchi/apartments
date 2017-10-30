# Supported search filter subpaths:
#
#   studio
#   1-bed
#   1-bed_pet-friendly
#   1-bed_1-bath_pet-friendly
#   over-700
#   under-1500
#   700-to-1500
#   700-to-1500_pet-friendly-dog
#   700-to-1500_pet-friendly-cat
#   700-to-1500_pet-friendly
#   over-500_pet-friendly-dog/dishwasher_parking
#   700-to-1500_pet-friendly/air-conditioning_washer-dryer_dishwasher_parking_fitness-center_\
#   wheelchair-accessible_pool_furnished_elevator_washer-dryer-hookup_laundry-facilities
class SearchFilterSubpathParser
  class InvalidPathError < StandardError
    def initialize(filter_subpath)
      msg = "Invalid path: #{filter_subpath}"
      super(msg)
    end
  end

  def parse(filter_subpath)
    raise InvalidPathError, filter_subpath unless valid_path?(filter_subpath)

    {
      bedroom_count:  parse_bedroom_count(filter_subpath),
      bathroom_count: parse_bathroom_count(filter_subpath),
      rent:           parse_rent(filter_subpath),
      pet:            parse_pet(filter_subpath),
      amenities:      parse_amenities(filter_subpath)
    }.compact
  end

  private

  # 0.0 for none, 0.5 for studio, 1.0 for 1-bed, etc
  def parse_bedroom_count(path_segment)
    return if path_segment.blank?

    regex = ::Regexp.union([/studio/, /(\d{1})-bed/])

    captured_list = path_segment.scan(regex).flatten
    return if captured_list.blank?

    count = captured_list.compact.first
    count.nil? ? 0.5 : count.to_f
  end

  # 0.0 for none, 1.0 for 1-bath, etc
  def parse_bathroom_count(path_segment)
    return if path_segment.blank?

    regex = /(\d{1})-bath/

    captured_list = path_segment.scan(regex).flatten
    return if captured_list.blank?

    count = captured_list.compact.first
    count.to_f
  end

  # { min: 700, max: 1500 } or nil
  def parse_rent(path_segment)
    return if path_segment.blank?

    rent_min_regex = /(over)-(\d{3,4})/
    rent_max_regex = /(under)-(\d{3,4})/
    rent_range_regex = /(\d{3,4})-to-(\d{3,4})/
    rent_regex_union = ::Regexp.union [rent_min_regex, rent_max_regex, rent_range_regex]

    captured_list = path_segment.scan(rent_regex_union).flatten
    return nil if captured_list.blank?

    tokens = captured_list.compact
    case tokens.first
    when "over"
      { min: tokens[1].to_i }
    when "under"
      { max: tokens[1].to_i }
    else
      { min: tokens[0].to_i, max: tokens[1].to_i }
    end
  end

  # "all", "dog", "cat", or nil
  def parse_pet(path_segment)
    return if path_segment.blank?

    pet_regex = /pet-friendly-?(dog|cat)?/

    captured_list = path_segment.scan(pet_regex).flatten
    return if captured_list.blank?

    pet_type = captured_list.compact.first
    pet_type.nil? ? "ok" : pet_type
  end

  # e.g. ["air-conditioning", "washer-dryer", "dishwasher"] or nil
  def parse_amenities(path_segment)
    return if path_segment.blank?

    regex = ::Regexp.union [
      /washer-dryer-hookup/,
      /washer-dryer/,
      /air-conditioning/,
      /dishwasher/,
      /parking/,
      /fitness-center/,
      /wheelchair-accessible/,
      /pool/,
      /furnished/,
      /elevator/,
      /laundry-facilities/
    ]

    path_segment.scan(regex).presence
  end

  def valid_path?(path)
    URI.parse(path).path.present?
  rescue
    false
  end
end
